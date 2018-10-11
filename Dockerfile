FROM registry.centos.org/che-stacks/centos-stack-base

RUN sudo dnf -y update && \
    sudo dnf -y install centos-release-scl && \
    sudo dnf -y install git && \
    sudo dnf -y install gcc && \
    sudo dnf -y install libedit-devel && \
    sudo dnf -y install python-yaml && \
    sudo dnf -y install make 

CMD tail -f /dev/null 
