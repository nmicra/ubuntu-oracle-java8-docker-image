FROM ubuntu

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y apt-utils
RUN apt-get install -y net-tools
RUN apt-get install -y iputils-ping
RUN apt-get install -y curl
RUN apt-get install -y iproute2
RUN apt-get install less
RUN apt-get install -y nmap
RUN apt-get install -y tzdata
RUN apt-get install -y telnet


# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer
  
ENV TZ=Asia/Jerusalem
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata
WORKDIR /work

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]
