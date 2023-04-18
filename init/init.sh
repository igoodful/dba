#!/bin/bash
yum -y update
yum -y install epel-release
yum clean all
yum makecache
yum -y install cmake3


