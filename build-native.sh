#!/usr/bin/env bash

scriptPath="$(dirname "$0")"
cimguiPath="$scriptPath/cimgui"
cimplotPath="$scriptPath/cimplot"

_CMakeBuildType=Debug
_CMakeOsxArchitectures=

while :; do
    if [ $# -le 0 ]; then
        break
    fi

    lowerI="$(echo $1 | awk '{print tolower($0)}')"
    case $lowerI in
        debug|-debug)
            _CMakeBuildType=Debug
            ;;
        release|-release)
            _CMakeBuildType=Release
            ;;
        -osx-architectures)
            _CMakeOsxArchitectures=$2
            shift
            ;;
        *)
            __UnprocessedBuildArgs="$__UnprocessedBuildArgs $1"
    esac

    shift
done

build_project() {
    local projectPath=$1
    mkdir -p "$projectPath/build/$_CMakeBuildType"
    pushd "$projectPath/build/$_CMakeBuildType"
    cmake ../.. -DCMAKE_OSX_ARCHITECTURES="$_CMakeOsxArchitectures" -DCMAKE_OSX_DEPLOYMENT_TARGET=10.13 -DCMAKE_BUILD_TYPE=$_CMakeBuildType
    make
    popd
}

build_project "$cimguiPath"
build_project "$cimplotPath"
