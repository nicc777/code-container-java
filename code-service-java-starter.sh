#!/bin/sh

echo "Starting the code-server-java"
cd /code-server/projects

su -c "code-server --user-data-dir=/data --install-extension adashen.vscode-tomcat"
su -c "code-server --user-data-dir=/data --install-extension Pivotal.vscode-spring-boot"
su -c "code-server --user-data-dir=/data --install-extension redhat.java"
su -c "code-server --user-data-dir=/data --install-extension shengchen.vscode-checkstyle"
su -c "code-server --user-data-dir=/data --install-extension SonarSource.sonarlint-vscode"
su -c "code-server --user-data-dir=/data --install-extension SummerSun.vscode-jetty"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-java-debug"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-java-dependency"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-java-pack"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-java-test"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-maven"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-spring-boot-dashboard"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-spring-initializr"

chown -R code /data
su -c "code-server --auth=none --disable-telemetry --disable-update-check --bind-addr=0.0.0.0:8061 --user-data-dir=/data --verbose" code

