@echo off

cd openpose

rem // basic
rem bin\OpenPoseDemo.exe

rem // recording
bin\OpenPoseDemo.exe --write_json %~dp0\record\

rem // basic hands and face, ~50% fps vs. body only
rem bin\OpenPoseDemo.exe --hand --face

rem // high precision mode, requires > 8GB VRAM
rem bin\OpenPoseDemo.exe --net_resolution "1312x736" --scale_number 4 --scale_gap 0.25

rem // 3D mode, requires > 1 camera
rem bin\OpenPoseDemo.exe --flir_camera --3d --number_people_max 1

@pause
