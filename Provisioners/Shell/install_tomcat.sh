echo "Updating Packages"
sudo yum update
echo "Upgrading Packages"
sudo yum upgrade -y
echo "Installing Java 11"
sudo yum -y install  java-11-openjdk java-11-openjdk-devel
echo "Checking Java Version"
java -version
echo "Setting Java Environment Vairables"
sudo tee /etc/profile.d/java11.sh <<EOF
export JAVA_HOME=\$(dirname \$(dirname \$(readlink \$(readlink \$(which javac)))))
export PATH=\$PATH:\$JAVA_HOME/bin
export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar
EOF
