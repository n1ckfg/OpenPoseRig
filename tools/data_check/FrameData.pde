class FrameData {
  
  ArrayList<String> rawFrameData;
  ArrayList<PVector> points_2d;
  ArrayList<PVector> points_2d_sorted;
  ArrayList<Coord> points_3d;
  
  FrameData(ArrayList<String> inputData) {
    rawFrameData = inputData;
    points_2d = new ArrayList<PVector>();
    points_2d_sorted = new ArrayList<PVector>();
    points_3d = new ArrayList<Coord>();
    
    for (int i=0; i<rawFrameData.size(); i++) {
      String s = rawFrameData.get(i);
      s = s.replace("[", "").replace("]","");
      String[] rawCoords = s.split(" ");
      ArrayList<String> readyCoords = new ArrayList<String>();
      for (int j=0; j<rawCoords.length; j++) {
        if (rawCoords[j].length() > 2) {
          readyCoords.add(rawCoords[j]);
        }
      }
      points_2d.add(convertRawCoords(readyCoords.get(0), readyCoords.get(1)));
      points_2d.add(convertRawCoords(readyCoords.get(2), readyCoords.get(3)));
    }
    
    for (int i=0; i<int(points_2d.size()/3)*2; i++) {
      points_2d_sorted.add(points_2d.get(i));
    }
    
    for (int i = int(points_2d.size()/3)*2; i<points_2d.size(); i++) {
      points_2d_sorted.add(points_2d.get(i));
    }
    
    for (int i=0; i<points_2d.size(); i+=3) {
      points_3d.add(new Coord(points_2d.get(i), points_2d.get(i+1), points_2d.get(i+2)));
    }
}
  
  PVector convertRawCoords(String x, String y) {
    return new PVector(convertRawCoord(x), convertRawCoord(y));
  }
   
  float convertRawCoord(String s) {
    String s2[] = s.split("e");
    String f2 = s2[1].replace("e+", "");
    float f = float(s2[0]) * float(f2);
    return f;
  }
 
  void draw2d() {
    for (int i=1; i<points_3d.size(); i++) {
      points_3d.get(i).draw2d();
    }
  }
  
  void draw3d() {
    //
  }
}

class Coord {
  
  float globalScale = 5;
  
  PVector px;
  PVector py;
  PVector pz;
  
  PVector p;
  
  Coord(PVector _px, PVector _py, PVector _pz) {
    px = _px.mult(globalScale);
    py = _py.mult(globalScale);
    pz = _pz.mult(globalScale);
    // TODO p
  }
  void draw2d() {
      strokeWeight(1);
      stroke(0);
      fill(255);
      
      beginShape();
      vertex(px.x, px.y);
      vertex(py.x, py.y);
      vertex(pz.x, pz.y);
      endShape();
      
      pushMatrix();
      translate(px.x, px.y);
      sphereDetail(2);
      sphere(10);
      popMatrix();

      pushMatrix();
      translate(py.x, py.y);
      sphereDetail(2);
      sphere(10);
      popMatrix();

      pushMatrix();
      translate(pz.x, pz.y);
      sphereDetail(2);
      sphere(10);
      popMatrix();
  }
  
  void draw3d() {
    //
  }
   
}
