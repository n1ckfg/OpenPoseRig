String fileName = "000000000037_keypoints.json";

ArrayList<PVector> pose;

void setup() {
  size(1024, 768, P3D);
  
  JSONObject json = loadJSONObject(fileName);
  JSONObject jsonPose = (JSONObject) json.getJSONArray("people").get(0);
  JSONArray jsonFloats = (JSONArray) jsonPose.getJSONArray("pose_keypoints_2d");
  
  float[] poseRaw = new float[jsonFloats.size()];
  for (int i=0; i<poseRaw.length; i++) {
    poseRaw[i] = jsonFloats.getFloat(i);
  }
  println(jsonPose);
  
  pose = poseToVec(poseRaw);
  println(pose.size());
}

void draw() {
  background(127);
  stroke(0);
  noFill();
  strokeWeight(8);
  for (int i=0; i<pose.size(); i++) {
    PVector p = pose.get(i);
    point(p.x, p.y);
  }
  
  strokeWeight(2);
  // r arm
  beginShape();
  idxToVert(1);
  idxToVert(2);
  idxToVert(3);
  idxToVert(4);
  endShape();
  
  // l arm
  beginShape();
  idxToVert(1);
  idxToVert(5);
  idxToVert(6);
  idxToVert(7);
  endShape();
  
  // r leg
  beginShape();
  idxToVert(1);
  idxToVert(8);
  idxToVert(9);
  idxToVert(10);
  endShape();
  
  // l leg
  beginShape();
  idxToVert(1);
  idxToVert(11);
  idxToVert(12);
  idxToVert(13);
  endShape();
  
  // neck
  beginShape();
  idxToVert(1);
  idxToVert(0);
  endShape();
  
  //r eye
  beginShape();
  idxToVert(0);
  idxToVert(14);
  idxToVert(16);
  endShape();
  
  //l eye
  beginShape();
  idxToVert(0);
  idxToVert(15);
  idxToVert(17);
  endShape();
}

void idxToVert(int index) {
  float x = pose.get(index).x;
  float y = pose.get(index).y;
  if (x != 0 && y != 0) {
    vertex(x, y);
  }
}

ArrayList<PVector> poseToVec(float[] pose) {
  ArrayList<PVector> returns = new ArrayList<PVector>();
  for (int i=0; i<pose.length; i+=3) {
    float x = pose[i];
    float y = pose[i+1];
      returns.add(new PVector(x, y));
  }
  return returns;
}
