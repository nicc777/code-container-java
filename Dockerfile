FROM nicc777/code-container

LABEL CodeServerVersion 4.1.0

# Startup script
WORKDIR /opt/bin
COPY code-service-java-starter.sh .
RUN chmod 700 *

# This is some silly requirement for openjdk to install successfully (see https://stackoverflow.com/questions/58160597/docker-fails-with-sub-process-usr-bin-dpkg-returned-an-error-code-1)
RUN mkdir -p /usr/share/man/man1

# Refer to https://wiki.debian.org/Java for details on installing openjdk on Debian
RUN apt-get install -y default-jdk

# For saving JAR's and other libs you may need in your project
RUN mkdir -p /code-user/lib
RUN chown -R code /code-user/lib
VOLUME [ "/code-user/projects", "/code-user/lib" ]

# The code-server port is 8061, but a lot more ports are exposed in case you want to run some service inside this container and access it from outside
EXPOSE 8000-8999

CMD ["/opt/bin/code-service-java-starter.sh"]

