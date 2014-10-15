# chkconfig: - 98 10

# Source function library.
#. /etc/init.d/functions
RETVAL=$?

case "$1" in
 test)
        ;;      #goog
 prod)
        ;;      #good
 *)
        echo $"Usage: $0 {test|prod} {start|stop}"
        exit 1
        ;;
esac

USER=swadm
export JAVA_HOME="/swadm/software/java/jdk1.7.0_09"
export JAVA_OPTS="-Xms256m -Xmx1G -XX:MaxPermSize=256M"
export CATALINA_HOME="/swadm/tomcat_$1"

case "$2" in
 start)
        if [ -f $CATALINA_HOME/bin/startup.sh ];
          then
             echo $"Starting $USER ($1) Tomcat..."
             $CATALINA_HOME/bin/startup.sh
          else
             echo $"$0 can't execute $CATALINA_HOME/bin/startup.sh: file not found"
             exit 1
        fi
        ;;
 stop)
        if [ -f $CATALINA_HOME/bin/shutdown.sh ];
          then
             echo $"Stopping $USER ($1) Tomcat..."
             $CATALINA_HOME/bin/shutdown.sh
          else
             echo $"$0 can't execute $CATALINA_HOME/bin/shutdown.sh: file not found"
             exit 1
        fi
        ;;
 *)
        $"Usage: $0 {test|prod} {start|stop}"
        exit 1
        ;;
esac
exit $RETVAL