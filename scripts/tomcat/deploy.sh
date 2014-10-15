# assumptions:
# user is swadm (sudo su - swadm); 
# working dir is /swadm; 
# existence of tomcat.sh in working dir; 
# tmi-20.war to be deployed in /home/$USER
# ROOT.war in /swadm/tomcat_<env>/webapps

# NOTE: update script when TMI version moves off 2.0, e.g., tmi-2.0.war

today=$(date +"%Y%m%d_%H:%M:%S")

case "$1" in
 test)
        ;;      #goog
 prod)
        ;;      #good
 *)
        echo $"Usage: $0 {test|prod}"
        exit 1
        ;;
esac

webapps=/swadm/tomcat_$1/webapps

echo "moving .war file from user's home dir to $webapps...."
scp rmcewan@localhost:~/tmi-2.0.war $webapps

echo "stopping tomcat....."
./tomcat.sh $1 stop

echo "moving $1 ROOT.war to /swadm/software/undeployed/$1/$today.war"
mv $webapps/ROOT.war /swadm/software/undeployed/$1/$today.war

echo "renaming $webapps/tmi-2.0.war to $webapps/ROOT.war"
mv $webapps/tmi-2.0.war $webapps/ROOT.war

chmod 755 $webapps/ROOT.war

echo "starting tomcat...." 
./tomcat.sh $1 start