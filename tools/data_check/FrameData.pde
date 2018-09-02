class FrameData {
  
  float globalScale = 1000;
  
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
      points_2d.add(new PVector(float(rawCoords[0]), float(rawCoords[1])));
      points_2d.add(new PVector(float(rawCoords[2]), float(rawCoords[3])));
    }
    
    for (int i=0; i<points_2d.size(); i+=3) {
      points_3d.add(new Coord(points_2d.get(i), points_2d.get(i+1), points_2d.get(i+2)));
    }
  }
 
  void draw() {
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
    pp = pp.mult(globalScale);
    p = p.mult(globalScale);
    
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
