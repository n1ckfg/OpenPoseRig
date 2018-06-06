# basic
#./openpose/build/examples/openpose/openpose.bin

# recording
./openpose/build/examples/openpose/openpose.bin --write_json ./openpose/record/

# basic hands and face, ~50% fps vs. body only
#./openpose/build/examples/openpose/openpose.bin --hand --face

# high precision mode, requires > 8GB VRAM
#./openpose/build/examples/openpose/openpose.bin --net_resolution "1312x736" --scale_number 4 --scale_gap 0.25

# 3D mode, requires > 1 camera
#./openpose/build/examples/openpose/openpose.bin --flir_camera --3d --number_people_max 1
