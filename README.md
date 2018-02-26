# Doing Machines Mock Humans

A project where I will put machine learning stuff that I am learning about. All knowledge used on this project was got reading the book Pratical Machine Learning by Sunila Gollapudi.

# Docker

Building the image:

- docker build -t doing-machines-mock-humans/doing-machines-mock-humans:v1.0 .

Runing the image:

- docker run -tid -p 80:80 --name="doing-machines-mock-humans" -v "${PWD}":/var/www/app doing-machines-mock-humans/doing-machines-mock-humans:v1.0

Executing the image:

- docker exec -it doing-machines-mock-humans /bin/bash

## What is included on doing-machines-mock-humans/doing-machines-mock-humans:v1.0

- R Lang
- Python
- JDK and JRE
- Hadoop
- Mahout
- Scala
- Spark
