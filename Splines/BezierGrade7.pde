public class  BezierGrade7 {
  List<Vector> ctrlPoints = new ArrayList<Vector>();
  int numberOfPoints;
  float t=0;
  public BezierGrade7(List<Vector> ctrlPoints, int numberOfPoints) {
    this.ctrlPoints = ctrlPoints;
    this.numberOfPoints = numberOfPoints;
  }
  public Vector CalculateBezierGrade7(float u, Vector p0, Vector p1, Vector p2, Vector p3, Vector p4, Vector p5, Vector p6, Vector p7 ) {
    float ax, bx, cx, dx, ex, fx, gx, hx;
    float ay, by, cy, dy, ey, fy, gy, hy;
    float az, bz, cz, dz, ez, fz, gz, hz;
    
    hx = (p0.x());
    gx = (p1.x()*7); 
    fx = ((p2.x())*21);
    ex = ((p3.x())*35);
    dx = ((p4.x())*35);
    cx = ((p5.x())*21);
    bx = ((p6.x())*7);
    ax = p7.x();

    hy = (p0.y());
    gy = ((p1.y())*7); 
    fy = ((p2.y())*21);
    ey = ((p3.y())*35);
    dy = ((p4.y())*35);
    cy = ((p5.y())*21);
    by = ((p6.y())*7);
    ay = p7.y();

    hz = (p0.z());
    gz = ((p1.z())*7); 
    fz = ((p2.z())*21);
    ez = ((p3.z())*35);
    dz = ((p4.z())*35);
    cz = ((p5.z())*21);
    bz = ((p6.z())*7);
    az = p7.z();
    
    float t=1-u;
    float tt = t*t;
    float ttt = tt * t;
    float tttt = ttt * t;
    float ttttt = tttt * t;
    float tttttt = ttttt * t;
    float ttttttt = tttttt * t;

    
    Vector vect = new Vector();
    vect.setX((ax * ttttttt) + (bx * tttttt*u) + (cx * ttttt*u*u) + (dx * tttt*u*u*u) + (ex * ttt*u*u*u*u) + (fx * tt*u*u*u*u*u) + (gx * t*u*u*u*u*u*u) + (hx*u*u*u*u*u*u*u) );
    vect.setY((ay * ttttttt) + (by * tttttt*u) + (cy * ttttt*u*u) + (dy * tttt*u*u*u) + (ey * ttt*u*u*u*u) + (fy * tt*u*u*u*u*u) + (gy * t*u*u*u*u*u*u) + (hy*u*u*u*u*u*u*u) );
    vect.setZ((az * ttttttt) + (bz * tttttt*u) + (cz * ttttt*u*u) + (dz * tttt*u*u*u) + (ez * ttt*u*u*u*u) + (fz * tt*u*u*u*u*u) + (gz * t*u*u*u*u*u*u) + (hz*u*u*u*u*u*u*u) );
    return vect;
  }

  public void drawbc() {
    float   derivet;
    Vector draw= new Vector(), p0 = new Vector(), p1  = new Vector(), p2  = new Vector();
    Vector  p3  = new Vector(), p4  = new Vector(), p5  = new Vector(), p6  = new Vector();
    Vector p7  = new Vector();
    // dos curvas ya divide el conjunto de 
    
    p0 = ctrlPoints.get(0);
    p1 = ctrlPoints.get(1);
    p2 = ctrlPoints.get(2);
    p3 = ctrlPoints.get(3);
    p4 = ctrlPoints.get(4);
    p5 = ctrlPoints.get(5);
    p6 = ctrlPoints.get(6);
    p7 = ctrlPoints.get(7);
  
    line(p0.x(),p0.y(),p0.z(),p1.x(),p1.y(),p1.z());
    line(p1.x(),p1.y(),p1.z(),p2.x(),p2.y(),p2.z());
    line(p2.x(),p2.y(),p2.z(),p3.x(),p3.y(),p3.z());
    line(p3.x(),p3.y(),p3.z(),p2.x(),p2.y(),p2.z());
    line(p4.x(),p4.y(),p4.z(),p3.x(),p3.y(),p3.z());
    line(p5.x(),p5.y(),p5.z(),p4.x(),p4.y(),p4.z());
    line(p6.x(),p6.y(),p6.z(),p5.x(),p5.y(),p5.z());
    line(p7.x(),p7.y(),p7.z(),p6.x(),p6.y(),p6.z());
    for (int i = 0; i <= numberOfPoints; i++) {
      derivet=i/float (numberOfPoints);
      draw = CalculateBezierGrade7( derivet, p0, p1, p2, p3,p4,p5,p6,p7 );
      point(draw.x(), draw.y(), draw.z());
    }
    
  }
}
