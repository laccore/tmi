package edu.umn.laccore.tmi

import groovy.sql.Sql

import org.apache.commons.io.FileUtils

class XapService {
	
	def grailsApplication
	def dataSource
	
	def createFilesFromResource(XapResource xr) {
		FileUtils.writeByteArrayToFile(new File("${grailsApplication.config.pivot.staging.dir}/script/pivotpackager.sh"), xr.packagingScript)
		"chmod u+x ${grailsApplication.config.pivot.staging.dir}/script/pivotpackager.sh".execute()
		//FileUtils.writeByteArrayToFile(new File("${fileService.resourcesDir}/csv.sql"), pv.csvSql)
		createMetadataCsv(xr)
		FileUtils.writeByteArrayToFile(new File("${grailsApplication.config.pivot.staging.dir}/resources/TmiPivotDeployment.xap"), xr.deploymentXap)
	}

	/*
	 * SELECT n.name as nodename, idt.name as idname, i.name as imagename, i.filename,
		i.filename_medium as filenamemedium, i.filename_thumb as filenamethumb, i.lake_code as lakecode, i.lake_name as lakename, 
		i.magnification, i.notes, i.section, i.site_hole as sitehole,
       i.submitted_by as submittedby, i.year, i.taxon, 
		i.common_name as commonname, i.family, i.ui_tags as imageuitags,
       REPLACE(n.description, '\r\n', ' ') as `description`,
       REPLACE(n.distinguishing_features, '\r\n', ' ') as `distinguishingfeatures`, 
		n.ui_tags as nodeuitags, lt.name as lighttypename
		FROM node n, image i, identification_type idt, light_type lt
		WHERE n.id = i.unique_identification_id and
       idt.id = n.identification_type_id and
       n.class like '%Unique%' and
       (lt.id = i.light_type_id OR (i.light_type_id is NULL AND lt.id = 1))
		ORDER BY i.name
	 */
	
	def createMetadataCsv(XapResource xr) {
		def path = "${grailsApplication.config.pivot.staging.dir}/resources/TmiPivotMetadata.csv"
		def f = new File(path)
		FileUtils.deleteQuietly(f)
		//if (!f.delete()) {
		//	throw new RuntimeException("Problem cleaning out ${f.absolutePath}")
		//}
		//FileUtils.writeStringToFile(new File("${grailsApplication.config.pivot.staging.dir}/resources/TmiPivotMetadata.csv"), xr.metadataSql, null)
		def keyset = null; //A place to keep the column names
		def sql = new Sql(dataSource)
		sql.eachRow(xr.metadataSql) { row ->
					//If the keyset is null create one and add the column names
					if (keyset == null) {
						//We want all the column names 
						keyset = row.toRowResult().keySet()

						//create a nice header for our output
						f << keyset.collect {"${it}"}.join(",")
						f << "\n"
					}
					f << row.toRowResult().values().collect{ (it!=null)?/"${it.replaceAll(/"/,/'/)}"/:'\\N' }.join(",")
					f << "\n"
				}
	}
	
	def packageXap() {
		println new Date()
		//File f = new File("/Users/rmcewan/pivot/deployment/err${(new Date()).format('yyyyMMddHHmmss')}.log")
		def ow = new FileWriter("${grailsApplication.config.pivot.staging.dir}/logs/out.log") //${(new Date()).format('yyyyMMddHHmmss')}
		def ew = new FileWriter("${grailsApplication.config.pivot.staging.dir}/logs/err.log")
		def bow = new BufferedWriter(ow,1000000)
		def eow = new BufferedWriter(ew)
		//cmd line invocation
		//./pivotpackager.sh /Users/rmcewan/pivot /Users/rmcewan/Desktop/TMI/dev-images TmiPivotDeployment TmiPivotMetadata
		def cmd = "${grailsApplication.config.pivot.staging.dir}/script/pivotpackager.sh ${grailsApplication.config.pivot.staging.dir} ${grailsApplication.config.images.parent.location} TmiPivotDeployment TmiPivotMetadata"
		log.info "cmd line to pkg xap file: ${cmd}"
		def p = cmd.execute()
		p.consumeProcessOutput(bow,eow)
		p.waitForOrKill(120000)	//2min
		bow.flush()
		eow.flush()
		bow.close()
		eow.close()
		println "closed"
	}
	
	def refreshXap() {
		//def id = XapResource.find("select max(id) from XapResource")
		def xr = XapResource.find("from XapResource x where x.id=(select max(id) from XapResource xr)")
		createFilesFromResource(xr)
		packageXap()
	}
}
