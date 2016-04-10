import grails.util.Environment

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

grails.config.locations = ["file:/swadm/grails-config/${Environment.current.name}.groovy", "file:~/tmi/grails-config/ds_${Environment.current.name}.groovy"]

//grails -Dserver.port=8080 -Dtmi.config.location=~/tmi/ds_${Environment.current.name}.groovy run-app
//if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
//}

// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

//TMI tomcat users for manager UI
//prod 8080: tmi alc.zjPPl3, http://dbw23.msi.umn.edu:8080/manager/html
//test 8081: tmi p.a.ch2LL3l2,  http://dbw23.msi.umn.edu:8081/manager/html

//Test server port forwarding
//http://www.noah.org/wiki/SSH_tunnel outlines the configuration
/*
create ssh tunnel: ssh -D 8081 mcewanr@login.msi.umn.edu
config FF:manual proxy config socks5 port 8081
url pattern: http://dbw23.msi.umn.edu:8081/
*/

//deploy
//scp /Users/rmcewan/Documents/workspace-sts-2.7.0.M1/edu.umn.laccore.tmi/target/tmi-1.0.war mcewanr@login.msi.umn.edu:~/
/*deployment - complete
shutdown tomcat as tomcat2
login as mcewanr to login.msi.umn.edu
mv orig .war and rename
chmod 777 <name>.war
ssh dbw23
mv ~/<name>.war /website/images.tmi.msi.umn.edu/ROOT.war
sudo su - tomcat2
mv /website/images.tmi.msi.umn.edu/ROOT.war /website/tmi-test.msi.umn.edu/apache-tomcat-6.0.33/webapps/
chmod 755 /website/tmi-test.msi.umn.edu/apache-tomcat-6.0.33/webapps/ROOT.war
rm -R ROOT dir
./website/tmi-test.msi.umn.edu/apache-tomcat-6.0.33/bin/startup.sh

check perms of images:
tomcat2@dbw23:/website/tmi.msi.umn.edu/apache-tomcat-6.0.33/webapps/ROOT> ls -la images/
total 116
drwxr-xr-x 12 tomcat2 tomcat2  4096 2011-10-31 17:00 .
drwxr-xr-x 11 tomcat2 tomcat2  4096 2011-10-31 13:24 ..
drwxrws---  9 tomcat2 tomcat2  4096 2011-10-31 18:29 algae
drwxrws---  4 tomcat2 tomcat2  4096 2011-10-31 18:36 arthropod
drwxrws---  3 tomcat2 tomcat2  4096 2011-10-31 15:26 facies
drwxr-xr-x  2 tomcat2 tomcat2  4096 2011-10-31 13:24 fam
-rw-r--r--  1 tomcat2 tomcat2 10134 2011-02-16 08:14 favicon.ico
drwxrws---  3 tomcat2 tomcat2  4096 2011-10-31 16:46 fish
-rw-r--r--  1 tomcat2 tomcat2  8065 2011-02-16 08:14 grails_logo.jpg
-rw-r--r--  1 tomcat2 tomcat2 10172 2011-02-16 08:14 grails_logo.png
drwxrws---  6 tomcat2 tomcat2  4096 2011-10-31 18:28 invertebrate
-rw-r--r--  1 tomcat2 tomcat2  3859 2011-02-16 08:14 leftnav_btm.png
-rw-r--r--  1 tomcat2 tomcat2  2883 2011-02-16 08:14 leftnav_midstretch.png
-rw-r--r--  1 tomcat2 tomcat2  3317 2011-02-16 08:14 leftnav_top.png
drwxr-xr-x 25 tomcat2 tomcat2  4096 2011-10-31 18:36 mineral
drwxr-xr-x  7 tomcat2 tomcat2  4096 2011-10-31 18:38 plant
drwxr-xr-x  2 tomcat2 tomcat2  4096 2011-10-31 13:24 skin
-rw-r--r--  1 tomcat2 tomcat2  2037 2011-02-16 08:14 spinner.gif
-rw-r--r--  1 tomcat2 tomcat2  9109 2011-02-16 08:14 springsource.png
drwxr-xr-x  2 tomcat2 tomcat2 12288 2011-10-31 18:41 unlinked

copy images to CATALINA_HOME:
tomcat2@dbw23:/website/tmi.msi.umn.edu/apache-tomcat-6.0.33/webapps/ROOT> cp -rp images/ /website/tmi.msi.umn.edu/apache-tomcat-6.0.33/

check perms of copied images:
tomcat2@dbw23:/website/tmi.msi.umn.edu/apache-tomcat-6.0.33/webapps/ROOT> ls -ls /website/tmi.msi.umn.edu/apache-tomcat-6.0.33/images/
total 104
 4 drwxrws---  9 tomcat2 tomcat2  4096 2011-10-31 18:29 algae
 4 drwxrws---  4 tomcat2 tomcat2  4096 2011-10-31 18:36 arthropod
 4 drwxrws---  3 tomcat2 tomcat2  4096 2011-10-31 15:26 facies
 4 drwxr-xr-x  2 tomcat2 tomcat2  4096 2011-10-31 13:24 fam
12 -rw-r--r--  1 tomcat2 tomcat2 10134 2011-02-16 08:14 favicon.ico
 4 drwxrws---  3 tomcat2 tomcat2  4096 2011-10-31 16:46 fish
 8 -rw-r--r--  1 tomcat2 tomcat2  8065 2011-02-16 08:14 grails_logo.jpg
12 -rw-r--r--  1 tomcat2 tomcat2 10172 2011-02-16 08:14 grails_logo.png
 4 drwxrws---  6 tomcat2 tomcat2  4096 2011-10-31 18:28 invertebrate
 4 -rw-r--r--  1 tomcat2 tomcat2  3859 2011-02-16 08:14 leftnav_btm.png
 4 -rw-r--r--  1 tomcat2 tomcat2  2883 2011-02-16 08:14 leftnav_midstretch.png
 4 -rw-r--r--  1 tomcat2 tomcat2  3317 2011-02-16 08:14 leftnav_top.png
 4 drwxr-xr-x 25 tomcat2 tomcat2  4096 2011-10-31 18:36 mineral
 4 drwxr-xr-x  7 tomcat2 tomcat2  4096 2011-10-31 18:38 plant
 4 drwxr-xr-x  2 tomcat2 tomcat2  4096 2011-10-31 13:24 skin
 4 -rw-r--r--  1 tomcat2 tomcat2  2037 2011-02-16 08:14 spinner.gif
12 -rw-r--r--  1 tomcat2 tomcat2  9109 2011-02-16 08:14 springsource.png
 8 drwxr-xr-x  2 tomcat2 tomcat2  8192 2011-10-31 18:41 unlinked
tomcat2@dbw23:/website/tmi.msi.umn.edu/apache-tomcat-6.0.33/webapps/ROOT>

deploy new war file from dev env:
D20110529:~ rmcewan$ scp Documents/workspace-sts-2.7.0.M1/edu.umn.laccore.tmi/target/tmi-1.0.war mcewanr@hosting.msi.umn.edu:/website/images.tmi.msi.umn.edu/ROOT.war
OR move
mcewanr@db2 [~] % mv ROOT.war /website/tmi.msi.umn.edu/images/


mv war file to webapps:
tomcat2@dbw23:/website/tmi.msi.umn.edu/apache-tomcat-6.0.33/webapps> mv /website/images.tmi.msi.umn.edu/ROOT.war .
tomcat2@dbw23:/website/tmi.msi.umn.edu/apache-tomcat-6.0.33/webapps> chmod 755 ROOT.war

start tomcat:
tomcat2@dbw23:/website/tmi.msi.umn.edu/apache-tomcat-6.0.33/webapps> ./../bin/startup.sh (takes a while)


remove deployed images dir and replace with earlier copy of images:
tomcat2@dbw23:/website/tmi.msi.umn.edu/apache-tomcat-6.0.33/webapps/ROOT> rm -R images/
tomcat2@dbw23:/website/tmi.msi.umn.edu/apache-tomcat-6.0.33/webapps/ROOT> cp -rp ../../images/ .
*/

//db refresh from prod
// from hosting
//mysqldump -u tmi_web --port=3306 -p --host 127.0.0.1 --single-transaction --add-drop-table --skip-add-locks tmi_prod_myrboa > prod.sql
//mysql -u tmi_web -p -P 3306 -h 127.0.0.1 tmi_test_myrboa < prod.sql

//most db commands
/*mcewanr@dbw23 [~] % history | grep mysql | more
42  mysqldump -u tmi_web --port=9906 -p --host 127.0.0.1 tmi_prod_myrboa > prod.sql
43  mysqldump -u tmi_web --port=9906 -p --host localhost tmi_prod_myrboa > prod.sql
44  mysqldump -u tmi_web --port=9906 -p --host 127.0.0.1 tmi_prod_myrboa > prod.sql
45  mysqldump -u tmi_web --port=9906 -p --host 127.0.0.1 --skip-add-locks tmi_prod_myrboa > prod.sql
46  mysqldump -u tmi_web --port=9906 -p --host 127.0.0.1 --single-transaction tmi_prod_myrboa > prod.sql
49  mysql -u username -p -h localhost data-base-name < data.sql
50  mysql -u tmi_web -p -h 127.0.0.1 tmi_test_myrboa < prod.sql
51  mysql -u tmi_web -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
52  mysqldump -u tmi_web --port=9906 -p --host 127.0.0.1 --single-transaction --add-drop-table tmi_prod_myrboa > prod.sql
59  mysql -u tmi_web -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
60  mysql -u tmi_web -p
61  mysql -u tmi_web -p --port=9906 -h 127.0.0.1
62  mysql -u mcewanr -p --port=9906 -h 127.0.0.1
63  mysql -u mcewanr -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
70  mysql -u tmi_web -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
71  mysql -u tmi_web -p --port=9906 -h 127.0.0.1
72  mysql -u tmi_web -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
73  mysql -u tmi_web -p --port=9906 tmi_test_myrboa < prod.sql
74  mysql -u tmi_web -p --port=9906 -h localhost tmi_test_myrboa < prod.sql
75  mysql -u tmi_web -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
76  mysql -u tmi_web -p --port=9906 -h 127.0.0.1
77  mysql -u tmi_web -p
78  mysql -u tmi_web -p --port=9906 -h 127.0.0.1
79  mysql -u tmi_web -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
80  mysql -u mcewanr -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
81  mysql -u tmi_web -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
125  mysql -u tmi_web -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
126  mysql -u tmi_web -p --port=9906 -h 127.0.0.1
127  mysql -u tmi_web -p --port=9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
128  mysql -u tmi_web -p -P 9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
131  mysqldump -u tmi_web --port=9906 -p --host 127.0.0.1 --single-transaction --add-drop-table --add-skip-locks tmi_prod_myrboa > prod.sql
132  mysqldump -u tmi_web --port=9906 -p --host 127.0.0.1 --single-transaction --add-drop-table --skip-add-locks tmi_prod_myrboa > prod.sql
134  mysql -u tmi_web -p -P 9906 -h 127.0.0.1 tmi_test_myrboa < prod.sql
136  mysql -u tmi_web -p --port=9906 -h 127.0.0.1
285  mysql -u tmi_web -p --port=9906 -h 127.0.0.1
413  mysql
415  mysql
417  mysql -u tmi_web --port=9906 -p --host 127.0.0.1
422  mysql -u tmi_web --port=9906 -p --host 127.0.0.1
462  mysql -u tmi_web --port=3306 -p --host 127.0.0.1
481  mysql -u tmi_web --port=3306 -p --host 127.0.0.1
494  mysql -u tmi_web --port=3306 -p --host 127.0.0.1
514  history | grep mysql | more
*/


//imports come with contact-form plugin
import java.awt.Font
import java.awt.Color

import com.octo.captcha.service.multitype.GenericManageableCaptchaService
import com.octo.captcha.engine.GenericCaptchaEngine
import com.octo.captcha.image.gimpy.GimpyFactory
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator
import com.octo.captcha.component.image.backgroundgenerator.GradientBackgroundGenerator
import com.octo.captcha.component.image.color.SingleColorGenerator
import com.octo.captcha.component.image.textpaster.NonLinearTextPaster
//end contact-form plugin imports

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text-plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      pdf: 'application/pdf',
                      rtf: 'application/rtf',
                      excel: 'application/vnd.ms-excel',
                      ods: 'application/vnd.oasis.opendocument.spreadsheet',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}
	debug 'edu.umn.laccore.tmi.auth'
    info  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate',
		   'grails.app.jobs'
	info 'grails.app.controllers' , 'grails.app.services', 'grails.app.domain', 'grails.app.jobs'
}

// Path to images, unlinked images and other static image resources in dev and test
// environments: customize with your local path.
tmi.imagePath = "/Users/bgrivna/Desktop/components"

// set per-environment serverURL stem for creating absolute links
environments {
	msi {
		grails.serverURL = "https://tmi.laccore.umn.edu"
		images.location.isRelative = false
		images.parent.location = "/website/images.tmi.msi.umn.edu/images"
		unlinked.images.location = "/website/images.tmi.msi.umn.edu/images/unlinked"
		coreFace.images.location = "/website/images.tmi.msi.umn.edu/images/coreface"
		artifact.images.location = "/website/images.tmi.msi.umn.edu/images/artifact"
		edge.images.location = "/website/images.tmi.msi.umn.edu/images/edges"
		question.images.location = "/website/images.tmi.msi.umn.edu/images/examples" // example images for Question nodes
		training.video = "/website/images.tmi.msi.umn.edu/mov/training_video_small.mov"
		pivot.staging.dir = "/website/images.tmi.msi.umn.edu/pivot"
	}
	production {
		grails.serverURL = "https://tmi.laccore.umn.edu"
		tmi.imagePath = "/swadm/images"
		images.location.isRelative = false
		images.parent.location = "${tmi.imagePath}"
		unlinked.images.location = "${tmi.imagePath}/unlinked"
		coreFace.images.location = "${tmi.imagePath}/coreface"
		artifact.images.location = "${tmi.imagePath}/artifact"
		edge.images.location = "${tmi.imagePath}/edges"
		question.images.location = "${tmi.imagePath}/examples" // example images for Question nodes
		training.video = "${tmi.imagePath}/mov/training_video_small.mov"
		pivot.staging.dir = "/swadm/pivot"
		//Added for use with relay.tc.umn.edu,
		grails {
			mail {
				from = "amyrbo@umn.edu"
				host = "relay.tc.umn.edu"
				port = 25
			}
		}
	}
	development {
		//grails.serverURL = "http://localhost:8080/${appName}"
		//grails.serverURL = "http://localhost:8888/${appName}"
		images.location.isRelative = false
		images.parent.location = "${tmi.imagePath}"
		unlinked.images.location = "${tmi.imagePath}/unlinked"
		coreFace.images.location = "${tmi.imagePath}/coreface"
		artifact.images.location = "${tmi.imagePath}/artifact"
		edge.images.location = "${tmi.imagePath}/edges"
		question.images.location = "${tmi.imagePath}/examples" // example images for Question nodes
		training.video = "${tmi.imagePath}/mov/training_video_small.mov"
		pivot.staging.dir = "pivot"
	}
	reed {
		tmi.imagePath = "/Users/rmcewan/Desktop/TMI/dev-images"
		images.location.isRelative = false
		images.parent.location = "${tmi.imagePath}"
		unlinked.images.location = "${tmi.imagePath}/unlinked"
		coreFace.images.location = "${tmi.imagePath}/coreface"
		artifact.images.location = "${tmi.imagePath}/artifact"
		edge.images.location = "${tmi.imagePath}/edges"
		question.images.location = "${tmi.imagePath}/examples" // example images for Question nodes
		training.video = "${tmi.imagePath}/mov/training_video_small.mov"
		pivot.staging.dir = "/website/images.tmi.msi.umn.edu/pivot"
		grails {
			mail {
				host = "smtp.gmail.com"
				username = "laccore.tmi"
				password = "tmitesting."
				props = ["mail.smtps.auth":"true","mail.smtp.socketFactory.port":"465","mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory","mail.smtp.socketFactory.fallback":"false"]
			}
		}
	}
	test {
		grails.serverURL = "http://geology-tmitest.oit.umn.edu:8080/tmi-2.0"
		tmi.imagePath = "/swadm/images"
		images.location.isRelative = false
		images.parent.location = "${tmi.imagePath}"
		unlinked.images.location = "${tmi.imagePath}/unlinked"
		coreFace.images.location = "${tmi.imagePath}/coreface"
		artifact.images.location = "${tmi.imagePath}/artifact"
		edge.images.location = "${tmi.imagePath}/edges"
		question.images.location = "${tmi.imagePath}/examples" // example images for Question nodes
		training.video = "${tmi.imagePath}/mov/training_video_small.mov"
		pivot.staging.dir = "/swadm/pivot"
	}

}

grails.plugins.springsecurity.controllerAnnotations.staticRules = [
	'/user/**': ['ROLE_ADMIN'],
	'/role/**': ['ROLE_ADMIN'],
	'/aclclass/**': ['ROLE_ADMIN'],
	'/aclEntry/**': ['ROLE_ADMIN'],
	'/aclObjectIdentity/**': ['ROLE_ADMIN'],
	'/aclSid/**': ['ROLE_ADMIN'],
	'/persistentLogin/**': ['ROLE_ADMIN'],
	'/register/**': ['ROLE_ANONYMOUS'],
	'/registrationCode/**': ['ROLE_ADMIN'],
	'/requestmap/**': ['ROLE_ADMIN'],
	'/securityInfo/**': ['ROLE_ADMIN']
 ]

//LDAP
grails.plugins.springsecurity.ldap.context.managerDn = ''
grails.plugins.springsecurity.ldap.context.managerPassword = ''
grails.plugins.springsecurity.ldap.authenticator.useBind = true
grails.plugins.springsecurity.ldap.context.server = 'ldaps://ldapauth.umn.edu:636'
grails.plugins.springsecurity.ldap.search.derefLink=true
grails.plugins.springsecurity.ldap.authorities.groupSearchBase ='ou=People'
grails.plugins.springsecurity.ldap.search.base = 'o=University of Minnesota,c=US'
grails.plugins.springsecurity.ldap.search.filter='(uid={0})'
grails.plugins.springsecurity.ldap.search.searchSubtree = true
grails.plugins.springsecurity.ldap.authorities.retrieveGroupRoles = false  	//don't try to get authorities (isMemberOf) from LDAP
grails.plugins.springsecurity.ldap.authorities.retrieveDatabaseRoles = true	//retrieve authorities/roles from DB

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'edu.umn.laccore.tmi.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'edu.umn.laccore.tmi.UserRole'
grails.plugins.springsecurity.authority.className = 'edu.umn.laccore.tmi.Role'
grails.plugins.springsecurity.requestMap.className = 'edu.umn.laccore.tmi.Requestmap'
//grails.plugins.springsecurity.securityConfigType = 'Requestmap'
grails.plugins.springsecurity.securityConfigType = 'Annotation'
grails.plugins.springsecurity.providerNames = ['ldapAuthProvider','daoAuthenticationProvider','anonymousAuthenticationProvider']

//Added for taggable plugin
grails.taggable.tag.autoImport=true
grails.taggable.tagLink.autoImport=true

//Added for user Spring Security UI plugin registration and forgot password emails
grails.plugins.springsecurity.ui.forgotPassword.emailSubject='TMI Password Reset'
grails.plugins.springsecurity.ui.register.emailSubject='TMI User Registration'

jcaptchas {
	captchaImage = new GenericManageableCaptchaService(
		new GenericCaptchaEngine(
			new GimpyFactory(
				new RandomWordGenerator(
					"abcdefghijklmnopqrstuvwxyz1234567890" // allowed characters
				),
				new ComposedWordToImage(
					new RandomFontGenerator(
						20, // min font size
						30, // max font size
						[new Font("Arial", 0, 10)] as Font[] // font type
					),
					new GradientBackgroundGenerator(
						140, // background width
						35, // background height
						new SingleColorGenerator(new Color(0, 60, 0)), // first background colour
						new SingleColorGenerator(new Color(20, 20, 20)) // second background colour
					),
					new NonLinearTextPaster(
						6, // minimal length of text
						6, // maximal length of text
						new Color(0, 255, 0) // text colour
					)
				)
			)
		),
		180, // minGuarantedStorageDelayInSeconds
		180000 // maxCaptchaStoreSize
	)
}
//grails.views.javascript.library="jquery"