#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR

cd openpose

PS3='Please enter your choice: '
options=("Demo" "Hands/Face" "Record" "Record HP" "Video" "Video HP" "3D")
select opt in "${options[@]}" 
do
    case $opt in
        "Demo")
            echo "Demo" # no recording
            ./build/examples/openpose/openpose.bin
            break
            ;;
        "Hands/Face")
            echo "Hands/Face" # ~50% fps vs. body only
            ./build/examples/openpose/openpose.bin --hand --face
            break
            ;;
        "Record")
            echo "Record"
            ./build/examples/openpose/openpose.bin --write_json record/
            break
            ;;
        "Record HP")
            echo "Record High Precision" # requires > 8GB VRAM
            ./build/examples/openpose/openpose.bin --net_resolution "1312x736" --scale_number 4 --scale_gap 0.25 --write_json record/
            break
            ;;
        "Video")
            echo "Video" # requires > 8GB VRAM
            ./build/examples/openpose/openpose.bin --video $1 --write_json record/
            break
            ;;
        "Video HP")
            echo "Video High Precision" # requires > 8GB VRAM
            ./build/examples/openpose/openpose.bin --video $1 --net_resolution "1312x736" --scale_number 4 --scale_gap 0.25 --write_json record/
            break
            ;;
        "3D")
            echo "3D" # requires > 1 camera
            ./build/examples/openpose/openpose.bin --flir_camera --3d --number_people_max 1
            break
            ;;
        *) echo invalid option;;
    esac
done


















