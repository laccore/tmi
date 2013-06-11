dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
	//show_sql = true
	//format_sql = true
	//use_sql_comments = true
}
// environment specific settings
environments {
    development {
        //dataSource {
        //    dbCreate = "create-drop" 
        //    url = "jdbc:hsqldb:mem:devDB"
        //}
		dataSource {
		    dbCreate = "update"
			pooled = true
		    driverClassName = "com.mysql.jdbc.Driver"
			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
		    username = "tmi_web"
		    password = "yctL3.cq]"
			url = "jdbc:mysql://127.0.0.1:3306/tmi_test_myrboa?autoReconnect=true"
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
    }
    test {
        dataSource {
		    dbCreate = "" //test db refreshed from prod
			pooled = true
		    driverClassName = "com.mysql.jdbc.Driver"
			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
		    username = "tmi_web"
		    password = "yctL3.cq]"
			url = "jdbc:mysql://mysql.msi.umn.edu:3306/tmi_test_myrboa?autoReconnect=true"
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
    }
    production {
        dataSource {
		    dbCreate = "update"
			pooled = true
		    driverClassName = "com.mysql.jdbc.Driver"
		    username = "tmi_web"
		    password = "yctL3.cq]"
			url = "jdbc:mysql://mysql.msi.umn.edu:3306/tmi_prod_myrboa?autoReconnect=true"
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
    }
}

