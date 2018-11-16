# Base the image on the standard C++ stack
FROM eclipse/cpp_gcc

# Basic system hygiene
RUN sudo apt-get -y update && \
    sudo apt-get -y upgrade && \

# Now create a directory, get the cmake code and install it
    cd /usr/local/bin && \
    sudo curl -O https://cmake.org/files/v3.8/cmake-3.8.0-Linux-x86_64.tar.gz && \
    sudo tar -xf cmake-3.8.0-Linux-x86_64.tar.gz && \
    sudo rm cmake-3.8.0-Linux-x86_64.tar.gz && \

# Put a symlink to the executable in the PATH
    sudo ln -s /usr/local/bin/cmake-3.8.0-Linux-x86_64/bin/cmake /usr/local/bin/cmake 

# IMPORTANT: The Dockerfile has to end with a non-terminating CMD. This works
# as well as any....
CMD tail -f /dev/null 
