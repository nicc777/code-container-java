# code-container-java

Based on the [nicc777/code-container](https://github.com/nicc777/code-container) repo, but focused on Java development in Visual Studio Code, allowing you to develop Java application in your browser using VSCode

**_Note_**: Java is rather "heavy" on resources and this container had to install a number of additional packages to satisfy all dependencies.

**_Note_**: At the moment (2022-01-06) there are a couple of extensions that failed to install - this will be addressed soon.

## Important Security Information

This project essentially packages a release from [another repository](https://github.com/cdr/code-server) for convenience. Please check the latest version in that repository and compare that with the version being built for this image. If you are not comfortable with any discrepancies, please do not use this image.

This solution assumes a private running environment and all authentication to the VSCode web interface have been disabled.

**_Important_**: Do not expose the running container directly to the Internet. This solution was intended for a PRIVATE and trusted networked environment.

HTTPS is not enabled. All network traffic is in the clear.

Telemetry and update checks have been disabled.

Commands below demonstrate how you can gain Terminal access to the running docker container. The image is based of Debian and you should therefore be able to use debian commands like `apt` if you need to install additional software. Just keep in mind that your packages will also be non-existent of you delete the container. A way to add additional packages on first run will be a feature I am considering - see the Feature Backlog at the end of this README.

My repositories are scanned by [Snyk](https://snyk.io/) and I will attempt to give attentions to issues as soon as possible, as and when they arise.

## Build

If you cloned this repository from GitHub, you can build the image with the following command:

```shell
docker build -t code-container-java .
```

To force a completely fresh build, try running:

```shell
docker build --no-cache -t code-container-java .
```

## Running the Container

### Preparing a persistent projects directory:

Below is an example of creating two directory where all your projects and java libraries will live. Even if you delete the container and images, any files you created or projects you worked on will still be available here.

```shell
mkdir -p $HOME/tmp/test-projects
mkdir -p $HOME/tmp/lib
```

### Running from Docker Hub:

```shell
docker pull nicc777/code-container-java
docker run --name codeservejava -d -p 127.0.0.1:8061:8061 -v $HOME/tmp/test-projects:/code-user/projects -v $HOME/tmp/lib:/code-user/lib nicc777/code-container-java
```

### Running a Custom Built Image:

```shell
docker run --name codeservejava -d -p 127.0.0.1:8061:8061 -v $HOME/tmp/test-projects:/code-user/projects -v $HOME/tmp/lib:/code-user/lib code-container-java
```

The extensions first need to be installed, which can take a minute or so. You can check when the server is ready by tailing the logs:

```shell
docker logs -f codeservejava
  .
  .
  .
Installing extensions...
  .
  .
  .
[2021-03-12T06:42:56.920Z] info  HTTP server listening on http://0.0.0.0:8081
```

By the time you see the last line above, the server is pretty much up. There may very well be some additional output after that line - that is fine. Unless of course you observe an error in the output - that may be a problem.

### Other Considerations 

If you opt to use the persistent project directory, keep in mind that any solution specific files or directories should always be used from the VSCode IDE, since there may be incompatibilities from the perspective of your host system.

Examples of this include the creation of Python virtual environments or installing Node modules for a project. 

You may need a terminal in the running container to achieve these goals - refer to the sections below for getting access to a terminal.

## Getting a terminal in the running Docker container (root user)

```shell
docker exec -it codeservejava bash
```

## Getting a terminal in VSCode (code user)

Press `CTRL`+`P` and then type `Terminal: Create New Integrated Terminal`

The first time, `zsh` will ask you to choose a option. Select either `1` or `2`. More info on [`zsh` can be found here...](https://www.zsh.org/)

## Installed Code Extensions

This will be the output of the command `code-server --list-extensions --user-data-dir=/data` as run on the container:

```text
GabrielBB.vscode-lombok
Gruntfuggly.todo-tree
hediet.vscode-drawio
mhutchie.git-graph
Pivotal.vscode-boot-dev-pack
Pivotal.vscode-concourse
Pivotal.vscode-manifest-yaml
Pivotal.vscode-spring-boot
redhat.fabric8-analytics
redhat.java
redhat.vscode-commons
redhat.vscode-xml
redhat.vscode-yaml
streetsidesoftware.code-spell-checker
VisualStudioExptTeam.vscodeintellicode
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-maven
vscjava.vscode-spring-boot-dashboard
vscjava.vscode-spring-initializr
yzhang.markdown-all-in-one
```

## Installed Packages

* Python3
* Git
* Node (v14)
* AWS CLI
* OpenJDK (default)

To confirm the exact OpenJDK package that was installed, you can run the following command (shown with the output):

```shell
docker exec -it codeservejava bash -c "dpkg -l | grep openjdk"
ii  openjdk-11-jdk:amd64          11.0.9.1+1-1~deb10u2        amd64        OpenJDK Development Kit (JDK)
ii  openjdk-11-jdk-headless:amd64 11.0.9.1+1-1~deb10u2        amd64        OpenJDK Development Kit (JDK) (headless)
ii  openjdk-11-jre:amd64          11.0.9.1+1-1~deb10u2        amd64        OpenJDK Java runtime, using Hotspot JIT
ii  openjdk-11-jre-headless:amd64 11.0.9.1+1-1~deb10u2        amd64        OpenJDK Java runtime, using Hotspot JIT (headless)
```

Also refer to the [Debian Java page](https://wiki.debian.org/Java) for more info.

## Feature Backlog

* Customize the installed packages at first run
* Customize the Extensions at first run
* Custom `zsh` config options
* Install [Oh My ZSH](https://ohmyz.sh/)
* Select a specific Java SDK
