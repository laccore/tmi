grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "info" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
       // mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.
		build 'commons-collections:commons-collections:3.1'	//for image tools
        runtime 'mysql:mysql-connector-java:5.1.20'
		
		//for UserDetails and UserDetailsService
		compile('org.springframework.security:spring-security-core:3.0.7.RELEASE') {
//			transitive = false
			excludes 'spring-expression', 'spring-core', 'spring-context', 'spring-tx',
			         'spring-aop', 'spring-jdbc', 'spring-web', 'spring-test', 'aspectjrt',
			         'aspectjweaver', 'cglib-nodep', 'ehcache', 'commons-collections',
			         'hsqldb', 'jsr250-api', 'log4j', 'junit', 'mockito-core', 'jmock-junit4'
		}
		compile ('org.apache.poi:poi-ooxml:3.7') {
			excludes "xmlbeans"	//needed, otherwise get linkage error; see https://jira.grails.org/browse/GPEXPORT-18
		}
    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.7.2"
        runtime ":resources:1.1.6"

        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0"
        //runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.4"

        build ":tomcat:$grailsVersion"

        runtime ":database-migration:1.1"

        compile ':cache:1.0.0'
		compile ':jcaptcha:1.2.1'
		
		compile ":spring-security-core:1.2.7.3"
		compile ":spring-security-ldap:1.0.6"
		compile ":spring-security-ui:0.2"
		compile (":export:1.6") {
			//excludes "xmlbeans"
		}
    }
}
