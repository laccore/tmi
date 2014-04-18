dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "sa"
	password = ""
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect" // ensure InnoDB (not MyISAM!) table engine type
	properties {
		maxActive = 50
		maxIdle = 25
		minIdle = 5
		initialSize = 5
		minEvictableIdleTimeMillis = 900000
		timeBetweenEvictionRunsMillis = 900000
		maxWait = 10000
		validationQuery = "select 1"
		testOnBorrow = true
		testWhileIdle = true
	}
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment-specific settings
environments {
    development {
		dataSource {
		    dbCreate = "update"
		    username = "tmi_web"
		    password = "yctL3.cq]"
			url = "jdbc:mysql://127.0.0.1:3306/tmi_test_myrboa?autoReconnect=true"
        }	
    }
	reed {
		dataSource {
			dbCreate = "update"
			username = "tmi_web"
			password = "yctL3.cq]"
			url = "jdbc:mysql://127.0.0.1:3306/tmi_test_myrboa?autoReconnect=true"
		}	
	}
    test {
        dataSource {
		    dbCreate = "" //test db refreshed from prod
		    username = "tmitest"
		    password = "yctL3.cq]"
			//url = "jdbc:mysql://mysql.msi.umn.edu:3306/tmi_test_myrboa?autoReconnect=true"
			url = "jdbc:mysql://localhost:3306/tmitest?autoReconnect=true"
        }	
    }
    production {
        dataSource {
		    dbCreate = "update"
		    username = "tmi_web"
		    password = "yctL3.cq]"
			url = "jdbc:mysql://mysql.msi.umn.edu:3306/tmi_prod_myrboa?autoReconnect=true"
		}
    }
}

