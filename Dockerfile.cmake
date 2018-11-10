FROM eclipse/cpp_gcc

RUN sudo apt-get -y update && \
    sudo apt-get -y upgrade && \
    cd /usr/local/bin && \
    sudo curl -O https://cmake.org/files/v3.8/cmake-3.8.0-Linux-x86_64.tar.gz && \
    sudo tar -xf cmake-3.8.0-Linux-x86_64.tar.gz && \
    sudo rm cmake-3.8.0-Linux-x86_64.tar.gz && \
    sudo ln -s /usr/local/bin/cmake-3.8.0-Linux-x86_64/bin/cmake /usr/local/bin/cmake 

CMD tail -f /dev/null 
