SETUP for OPENPOSE and 3D-POSE-BASELINE on Ubuntu 16.04 / 180505<br>

Note: OpenPose alone can record 3D coordinates with a multi-camera setup. However the 3d-pose-baseline method allows generating 3D coordinates for multiple subjects from a single camera.

1. Clone OpenPose:<br>
https://github.com/CMU-Perceptual-Computing-Lab/openpose<br>

2. Install CUDA, CUDNN, and OpenCV
```
./ubuntu/install_cuda.sh
./ubuntu/install.cudnn.sh
sudo apt-get install libopencv-dev python-opencv
```

3. Download models
```
./models/getModels.sh
```

4. Install Caffe and build OpenPose
```
./ubuntu/install_caffe_and_openpose_if_cuda8.sh
```

5. Sample OpenPose shell scripts for <a href="https://gist.github.com/n1ckfg/6eefa9dc0d3d641de1e209d12767275f">Ubuntu</a> and <a href="https://gist.github.com/n1ckfg/4c747763a2cf4602836c3283fd03c924">Windows</a>.

6. Clone 3D-pose-baseline (fork with OpenPose converter script):<br>
https://github.com/ArashHosseini/3d-pose-baseline<br> 

7. Install Python dependencies:
```
pip install h5py
pip install tensorflow
pip install imageio
pip install matplotlib
```

8. Download models:<br>

(Place in ./experiments/)<br>
https://drive.google.com/file/d/0BxWzojlLp259MF9qSFpiVjl0cU0/view?usp=sharing<br>

(Place in ./data/h36m/)<br>
https://www.dropbox.com/s/e35qv3n6zlkouki/h36m.zip<br>

9. Create a directory ./png for output.

10. Run a <a href="https://gist.github.com/n1ckfg/f82fde808f3c832350db7d6232a5b83f">sample shell script</a>.
