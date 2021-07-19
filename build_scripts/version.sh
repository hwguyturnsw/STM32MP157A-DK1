#!/bin/bash
#Buildroot Version Numbering
build=$(cat ../../build_scripts/build)
((build++))
echo $build > ../../build_scripts/build