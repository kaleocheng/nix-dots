#!/usr/bin/env bash
set -eu -o pipefail

## Export machine as var
uname_out="$(uname -s)"
case "${uname_out}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine=UNKNOWN
esac

if [ "$machine" = "UNKNOWN" ]
then
    echo "Unknow system: $unameOut, exiting..."
    exit 1
fi
export machine "$machine"


if [ "$machine" = "Linux" ]
then
    linux_os_out=$(hostnamectl | grep Operating | cut -d ':' -f2 | awk '{print $1}')
    case "${linux_os_out}" in
        NixOS*)     linux_os=nixos;;
        Ubuntu*)     linux_os=ubuntu;;
        *)          linux_os=UNKNOWN
    esac
    if [ "$linux_os" = "UNKNOWN" ]
    then
        echo "Unknow linux system: $linux_os, exiting..."
        exit 1
    fi
else
    linux_os="none"
fi
export linux_os "$linux_os"
