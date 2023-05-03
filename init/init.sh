#!/bin/bash
yum -y update
yum -y install epel-release
yum clean all
yum makecache
yum -y install cmake3

function git_upgrade(){
yum -y remove git
rpm -ivh http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-1.noarch.rpm
yum -y install git


}


function cmake_upgrade(){
yum -y remove cmake
wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3-linux-x86_64.tar.gz
tar -xzvf cmake-3.26.3-linux-x86_64.tar.gz
mv cmake-3.26.3-linux-x86_64 /usr/local/cmake
ln -s /usr/local/cmake/bin/cmake /usr/bin/cmake
}

function gcc_upgrade(){
yum -y install devtoolset-8-gcc devtoolset-8-gcc-c++ devtoolset-8-binutils
yum install centos-release-scl
yum install devtoolset-8
scl enable devtoolset-8 bash
source /opt/rh/devtoolset-8/enable
gcc --version

mv /usr/bin/gcc /usr/bin/gcc-4.8.5
ln -s /opt/rh/devtoolset-8/root/bin/gcc /usr/bin/gcc
mv /usr/bin/g++ /usr/bin/g++-4.8.5
ln -s /opt/rh/devtoolset-8/root/bin/g++ /usr/bin/g++

}



