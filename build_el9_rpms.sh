#!/bin/bash

set -e
set -x

podman system prune -a
podman build --progress=plain -t sems-rhel9 -f Dockerfile-rhel9 .
podman create --name temp-sems-rhel9 sems-rhel9
podman cp temp-sems-rhel9:/root/rpmbuild/RPMS /tmp/sems-el9-rpms
podman rm temp-sems-rhel9
ls -al /tmp/sems-el9-rpms/x86_64/ 
