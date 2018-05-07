public class  BezierCubic {
  List<Vector> ctrlPoints = new ArrayList<Vector>();
  int numberOfPoints;
  float t=0;
  public BezierCubic(List<Vector> ctrlPoints, int numberOfPoints) {
    this.ctrlPoints = ctrlPoints;
    this.numberOfPoints = numberOfPoints;
  }
  public Vector CalculateBezierCubic(float u, Vector p0, Vector p1, Vector p2, Vector p3) {
    float ax, bx, cx, dx;
    float ay, by, cy, dy;
    float az, bz, cz, dz;

    dx = p0.x();
    cx = p1.x()*3;
    bx = p2.x()*3;
    ax = p3.x() ;

    dy = p0.y();
    cy = p1.y()*3;
    by = p2.y()*3;
    ay = p3.y() ;

    dz = p0.z();
    cz = p1.z()*3;
    bz = p2.z()*3;
    az = p3.z() ;
    float t=1-u;
    float tt = t*t;
    float ttt = tt * t;
    
    Vector vect = new Vector();
    vect.setX((ax * ttt) + (bx * tt*u) + (cx * t*u*u) + (dx*u*u*u));
    vect.setY((ay * ttt) + (by * tt*u) + (cy * t*u*u) + (dy*u*u*u));
    vect.setZ((az * ttt) + (bz * tt*u) + (cz * t*u*u) + (dz*u*u*u));
    return vect;
  }

  public void drawbc() {
    float   derivet;
    Vector draw= new Vector(), p0 = new Vector(), p1  = new Vector(), p2  = new Vector(), p3  = new Vector();
    // dos curvas ya divide el conjunto de 
    
    line(ctrlPoints.get(7).x(),ctrlPoints.get(7).y(),ctrlPoints.get(7).z(),ctrlPoints.get(6).x(),ctrlPoints.get(6).y(),ctrlPoints.get(6).z());
    for (int j = 0; j < 4; j=j+3 ) {
      p0 = ctrlPoints.get(j );
      p1 = ctrlPoints.get(j + 1);
      p2 = ctrlPoints.get(j + 2);
      p3 = ctrlPoints.get(j + 3);
      line(p0.x(),p0.y(),p0.z(),p1.x(),p1.y(),p1.z());
      line(p1.x(),p1.y(),p1.z(),p2.x(),p2.y(),p2.z());
      line(p2.x(),p2.y(),p2.z(),p3.x(),p3.y(),p3.z());
      for (int i = 0; i <= numberOfPoints; i++) {
        derivet=i/float (numberOfPoints);
        draw = CalculateBezierCubic( derivet, p0, p1, p2, p3 );
        point(draw.x(), draw.y(), draw.z());
      }
    }
  }
}
