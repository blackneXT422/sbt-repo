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

main(){
    initSbtConfig "__IVY_HOME__" $SBT_IVY
    initSbtConfig "__SBT_DIR__" $SBT_DIR
    initSbtConfig "__SBT_BOOT__" $SBT_BOOT

    if [ -e /usr/bin/sbt ]; then
        ls -l /usr/bin/sbt
        echo -e "\033[31mlink [/usr/bin/sbt] already exist, do you want replease it? \033[0m"
        rm -i /usr/bin/sbt
    fi
    ln -s $SBT_DIR/bin/sbt /usr/bin/sbt
}

main
