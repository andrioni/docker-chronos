FROM andrioni/mesos:0.21.0

MAINTAINER Alessandro Andrioni <alessandro.andrioni@dafiti.com.br>

RUN curl -sL https://deb.nodesource.com/setup | bash -

RUN apt-get -y update

RUN apt-get install -y maven \
    nodejs \
    git

# Clone the Chronos repo
RUN git clone https://github.com/mesos/chronos.git

WORKDIR /chronos

RUN git checkout 09416a5cb882fd83b9996039a7b21fd747c08f6a

RUN mvn clean package

EXPOSE 8080

ENTRYPOINT ["bin/start-chronos.bash"]
