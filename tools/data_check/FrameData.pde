class FrameData {
  
  float globalScale = 5;
  
  ArrayList<String> rawFrameData;
  ArrayList<PVector> points_2d;
  ArrayList<Coord> points_3d;
  
  FrameData(ArrayList<String> inputData) {
    rawFrameData = inputData;
    points_2d = new ArrayList<PVector>();
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
    for (int i=1; i<points_2d.size(); i++) {
      PVector p = points_2d.get(i).mult(globalScale);
      PVector pp = points_2d.get(i-1).mult(globalScale);
      strokeWeight(5);
      stroke(0);
      line(p.x, p.y, pp.x, pp.y);
    }
  }
  
  void draw3d() {
    for (int i=0; i<points_3d.size(); i++) {
      PVector p = points_3d.get(i).p;
    
      if (i>0) {
        PVector pp = points_3d.get(i-1).p;
        drawLine(pp, p);
      }
      
      strokeWeight(1);
      stroke(0);
      fill(255);
      pushMatrix();
      translate(p.x, p.y, p.z);
      sphereDetail(2);
      sphere(10);
      popMatrix();
    }
  }
  
  void drawLine(PVector pp, PVector p) {
    strokeWeight(5);
    stroke(0);
    line(pp.x, pp.y, pp.z, p.x, p.y, p.z);
  }

  void drawChain(ArrayList<PVector> p) {
    for (int i=1; i<p.size(); i++) {
      drawLine(p.get(i-1), p.get(i));
    }
  }
  
}

class Coord {
  
  PVector px;
  PVector py;
  PVector pz;
  
  PVector p;
  
  Coord(PVector _px, PVector _py, PVector _pz) {
    px = _px;
    py = _py;
    pz = _pz;
    
    p = new PVector(random(width), random(height), random(1000));
  }
   
}
