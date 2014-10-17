#!/usr/bin/env bash
# Copyright 2014 Juniper Networks, Inc. All rights reserved.
# Auther: Shawnwang

readonly SCRIPT_NAME=$0
readonly CUR_DIR=$(pwd)

readonly SBT_DIR=$CUR_DIR/sbt
readonly SBT_BASE=$CUR_DIR/sbt-base
readonly SBT_BOOT=$SBT_BASE/boot
readonly SBT_IVY=$CUR_DIR/sbt-ivy

initSbtConfig(){
    local conf=$CUR_DIR/sbt/conf/sbtopts
    local opt=$1
    local dir=$(printf '%q' "$2")
    sed -i "s:$opt:${dir}:" $conf
}

createLink() {
    local sbtlink=~/bin/sbt
    if [ $(id -u) -eq 0 ]; then
        sbtlink=/usr/bin/sbt
        [ -d ~/bin ] || mkdir ~/bin
    fi
    
    if [ -e $sbtlink ]; then
        ls -l $sbtlink
        echo -e "\033[31mlink [$sbtlink] already exist, do you want replease it? \033[0m"
        rm -i $sbtlink
    fi
    ln -s $SBT_DIR/bin/sbt $sbtlink

}

main(){
    initSbtConfig "__IVY_HOME__" $SBT_IVY
    initSbtConfig "__SBT_DIR__" $SBT_DIR
    initSbtConfig "__SBT_BOOT__" $SBT_BOOT

    createLink
}

main
