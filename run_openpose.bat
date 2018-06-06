@echo off

rem // basic
rem openpose\bin\OpenPoseDemo.exe

rem // recording
openpose\bin\OpenPoseDemo.exe --write_json %~dp0\openpose\record\

rem // basic hands and face, ~50% fps vs. body only
rem openpose\bin\OpenPoseDemo.exe --hand --face

rem // high precision mode, requires > 8GB VRAM
rem openpose\bin\OpenPoseDemo.exe --net_resolution "1312x736" --scale_number 4 --scale_gap 0.25

rem // 3D mode, requires > 1 camera
rem openpose\bin\OpenPoseDemo.exe --flir_camera --3d --number_people_max 1

@pause
