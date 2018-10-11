FROM registry.centos.org/che-stacks/centos-stack-base

RUN dnf -y update && \
    dnf -y install centos-release-scl && \
    dnf -y install git && \
    dnf -y install gcc && \
    dnf -y install libedit-devel && \
    dnf -y install python-yaml && \
    dnf -y install make 

CMD tail -f /dev/null 
