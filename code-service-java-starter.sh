#!/bin/sh

echo "Starting the code-server-java"
cd /code-server/projects

su -c "code-server --user-data-dir=/data --install-extension adashen.vscode-tomcat"
su -c "code-server --user-data-dir=/data --install-extension shengchen.vscode-checkstyle"
su -c "code-server --user-data-dir=/data --install-extension SonarSource.sonarlint-vscode"
su -c "code-server --user-data-dir=/data --install-extension SummerSun.vscode-jetty"

su -c "code-server --user-data-dir=/data --install-extension GabrielBB.vscode-lombok"
su -c "code-server --user-data-dir=/data --install-extension Gruntfuggly.todo-tree"
su -c "code-server --user-data-dir=/data --install-extension hediet.vscode-drawio"
su -c "code-server --user-data-dir=/data --install-extension mhutchie.git-graph"
su -c "code-server --user-data-dir=/data --install-extension Pivotal.vscode-boot-dev-pack"
su -c "code-server --user-data-dir=/data --install-extension Pivotal.vscode-concourse"
su -c "code-server --user-data-dir=/data --install-extension Pivotal.vscode-manifest-yaml"
su -c "code-server --user-data-dir=/data --install-extension Pivotal.vscode-spring-boot"
su -c "code-server --user-data-dir=/data --install-extension redhat.fabric8-analytics"
su -c "code-server --user-data-dir=/data --install-extension redhat.java"
su -c "code-server --user-data-dir=/data --install-extension redhat.vscode-commons"
su -c "code-server --user-data-dir=/data --install-extension redhat.vscode-xml"
su -c "code-server --user-data-dir=/data --install-extension redhat.vscode-yaml"
su -c "code-server --user-data-dir=/data --install-extension streetsidesoftware.code-spell-checker"
su -c "code-server --user-data-dir=/data --install-extension VisualStudioExptTeam.vscodeintellicode"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-java-debug"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-java-dependency"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-java-pack"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-java-test"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-maven"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-spring-boot-dashboard"
su -c "code-server --user-data-dir=/data --install-extension vscjava.vscode-spring-initializr"
su -c "code-server --user-data-dir=/data --install-extension yzhang.markdown-all-in-one"


chown -R code /data
su -c "code-server --auth=none --disable-telemetry --disable-update-check --bind-addr=0.0.0.0:8061 --user-data-dir=/data --verbose" code

