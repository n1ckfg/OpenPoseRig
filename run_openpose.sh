cd openpose

# basic
#./build/examples/openpose/openpose.bin

# recording
./build/examples/openpose/openpose.bin --write_json record/

# basic hands and face, ~50% fps vs. body only
#./build/examples/openpose/openpose.bin --hand --face

# high precision mode, requires > 8GB VRAM
#./build/examples/openpose/openpose.bin --net_resolution "1312x736" --scale_number 4 --scale_gap 0.25

# 3D mode, requires > 1 camera
#./build/examples/openpose/openpose.bin --flir_camera --3d --number_people_max 1
