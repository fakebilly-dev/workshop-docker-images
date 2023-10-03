#!/usr/bin/env bash
set -ex

mkdir -pv /usr/local/maven
wget -qO /usr/local/maven/apache-maven-3.8.8.tar.gz https://archive.apache.org/dist/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
tar -zxf /usr/local/maven/apache-maven-3.8.8.tar.gz -C /usr/local/maven/
wget -qO /usr/local/maven/apache-maven-3.6.3.tar.gz https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -zxf /usr/local/maven/apache-maven-3.6.3.tar.gz -C /usr/local/maven/
cat >/etc/profile.d/maven.sh <<'EOF'
MAVEN_HOME_36=/usr/local/maven/apache-maven-3.6.3
MAVEN_HOME_38=/usr/local/maven/apache-maven-3.8.8

export MAVEN_HOME=$MAVEN_HOME_38
export PATH=$PATH:$MAVEN_HOME/bin

alias maven36="export MAVEN_HOME=$MAVEN_HOME_36"
alias maven38="export MAVEN_HOME=$MAVEN_HOME_38"
EOF
rm -rf /usr/local/maven/apache-maven-3.8.8.tar.gz /usr/local/maven/apache-maven-3.6.3.tar.gz