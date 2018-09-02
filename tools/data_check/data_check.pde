import peasy.PeasyCam;

PeasyCam cam;

int counter = 0;

/*
@ArashHosseini:
DO NOT FORGET that the issue does not include real 3d data. 
It is a projection and is very similar to "zbrush's" concept. 
The axes contain another array with X, Y data. 
You also need to know that the number of joints created is 32/2 = 16, which means 
16 jnt * 4 (x (x, y), y (x, y)) = 64 + z (16 * 2 ( x, y)) = 96.

@n1ckfg:
Another way of thinking about the representation:
Each coordinate is a screen projection of the original, so:
16 joints, each with three coordinates * xy coords = 6 floats.
*/

ArrayList<FrameData> frames = new ArrayList<FrameData>();

void setup() {
  size(1024, 768, P3D);
  cam = new PeasyCam(this, 400);

  String[] rawData = loadStrings("test.txt");
  
  for (int i=0; i<rawData.length; i+= 24) {
    ArrayList<String> inputData = new ArrayList<String>();
    for (int j=0; j<24; j++) {
      inputData.add(rawData[i+j]);
    }
    frames.add(new FrameData(inputData));
  }
}

void draw() {
  background(127, 63, 155);
  
  lights();
    
  frames.get(counter).draw2d();
  counter++;
  if (counter > frames.size()-1) counter = 0;
}
