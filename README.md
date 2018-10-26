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

