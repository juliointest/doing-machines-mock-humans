FROM ubuntu:16.04

# 1. Updating Repositories and Commom apps

RUN apt-get update \
    && apt-get install wget -y \
    && apt-get install nano

# 2. Installing R

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
    && apt-get update \
    && apt-get install r-base -y

# 3. Installing Python

RUN apt-get install python -y

# 4. Installing Julia

RUN mkdir -p /opt/julia-lang \
    && wget https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.2-linux-x86_64.tar.gz \
    && tar -xf julia-0.6.2-linux-x86_64.tar.gz -C /opt/julia-lang \
    && rm julia-0.6.2-linux-x86_64.tar.gz \
    && ln -s /opt/julia-lang/julia-d386e40c17/bin/julia /usr/local/bin/julia

# 5. Installing Java JDK

RUN apt-get install default-jre -y \
    && apt-get install default-jdk -y \
    && echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> /etc/environment

RUN . /etc/environment

# 6. Installing Hadoop

RUN mkdir -p /opt/hadoop \
    && wget http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-3.0.0/hadoop-3.0.0.tar.gz \
    && tar -xf hadoop-3.0.0.tar.gz -C /opt/hadoop \
    && rm hadoop-3.0.0.tar.gz \
    && ln -s /opt/hadoop/hadoop-3.0.0/bin/hadoop /usr/local/bin/hadoop \
    && echo "export HADOOP_HOME=/opt/hadoop/hadoop-3.0.0" >> /etc/environment \
    && echo "export HADOOP_LIBEXEC_DIR=${HADOOP_HOME}/libexec" >> /etc/environment

RUN . /etc/environment

# 7. Installing Apache Mahout

RUN mkdir -p /opt/apache-mahout \
    && wget http://archive.apache.org/dist/mahout/0.13.0/apache-mahout-distribution-0.13.0.tar.gz \
    && tar -xf apache-mahout-distribution-0.13.0.tar.gz -C /opt/apache-mahout \
    && rm apache-mahout-distribution-0.13.0.tar.gz \
    && ln -s /opt/apache-mahout/apache-mahout-distribution-0.13.0/bin/mahout /usr/local/bin/mahout

# 8. Installing Scala and Spark

RUN apt-get install scala -y \
    && mkdir -p /opt/apache-spark \
    && wget http://ftp.unicamp.br/pub/apache/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz \
    && tar -xf spark-2.2.1-bin-hadoop2.7.tgz -C /opt/apache-spark \
    && rm spark-2.2.1-bin-hadoop2.7.tgz
