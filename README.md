# Docker setup for the IR Terrier Platform

"Terrier is a highly flexible, efficient, and effective open source search engine, readily deployable on large-scale collections of documents. Terrier implements state-of-the-art indexing and retrieval functionalities, and provides an ideal platform for the rapid development and evaluation of large-scale retrieval applications." - http://terrier.org/

This docker setup is using terrier-core and terrier-desktop version 5.x as submodules.

## Installation

If you clone this repository then please do it in the following way so that all of its submodules get included as well:

``` 
git clone --recursive https://github.com/ChristophSchmidl/ir-terrier-docker.git
```

If you already cloned this repository in the standard way and discovered that its submodules are missing then you can still pull in its submodules by using the following command:

``` 
git submodule update --init
# if there are nested submodules:
git submodule update --init --recursive
```

## Usage

After cloning the repository just cd into it and invoke ```docker-compose up -d```. If you invoke this command for the first time it will fetch the Ubuntu image and install all required libraries in order to run terrier. It will also compile the terrier platform for you using maven and index the sample corpus.

When docker-compose is done you can check the container id by invoking ```docker container ls```. Copy the image name or the container id. The corresponding image name should be called something like "ir-terrier-docker_terrier". If your container id is 621679007f3c (change it accordingly) then you can connect to the container by invoking:

```docker exec -it 621679007f3c bash```

You are now connected to the terrier container and can use terrier as usual, i.e. ```./bin/terrier interactive```.

If you want to exit the box, write``èxit```.
If you want to shutdown the container, write ```docker-compose down```.


