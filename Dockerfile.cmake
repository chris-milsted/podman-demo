# Start with an image that we know works with Che
FROM registry.centos.org/che-stacks/centos-stack-base

MAINTAINER Doug Tidwell <doug.tidwell@redhat.com> 

# Run yum update for good system hygiene
RUN sudo yum -y update && \

# The next few lines fix a security issue 
    sudo yum -y install kernel-headers && \
    sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org && \
    sudo rpm -Uvh http://elrepo.org/linux/kernel/el7/x86_64/RPMS/elrepo-release-7.0-3.el7.elrepo.noarch.rpm && \
    sudo yum --enablerepo=elrepo-kernel -y install kernel-ml && \
    sudo yum --enablerepo=elrepo-kernel -y swap kernel-headers -- kernel-ml-headers && \

# Now install the tools and libraries we'll need 
    sudo yum -y install centos-release-scl gcc gcc-c++ make libedit-devel python-yaml curl java-1.8.0-openjdk-devel && \

# Finally, get the source code for cmake, build it, and create a symlink to it
    cd /usr/local/bin && \
    sudo curl -O https://cmake.org/files/v3.8/cmake-3.8.0.tar.gz && \
    sudo tar -xf cmake-3.8.0.tar.gz && \
    sudo rm cmake-3.8.0.tar.gz && \
    cd cmake-3.8.0 && \
    sudo ./bootstrap && \
    sudo make && \
    sudo ln -s /usr/local/bin/cmake-3.8.0/bin/cmake /usr/local/bin/cmake 

# The standard command to keep the container running
CMD tail -f /dev/null 
