public class  CubicaNatural  {

  List<Vector> ctrlPoints = new ArrayList<Vector>();
  private int numberOfPoints;

  public CubicaNatural(List<Vector> ctrlPoints, int numberOfPoints) {
    this.ctrlPoints = ctrlPoints;
    this.numberOfPoints = numberOfPoints;
  }
  private ArrayList<float[]> CalculateCN(float[] abcisasC, float[] G, int k) {
    ArrayList<float[]> arreglo = new  ArrayList<float[]>();
    float[] a;
    float[] b; 
    float[] c; 
    float[] d; 
    float[] O; 
    float[] derivate;
    a = new float[8];
    b = new float[8];
    c= new float[8];
    d  = new float[8];
    O = new float[8];
    derivate = new float[8];

    //calculamos abcisas
    O[0] = 3. *( abcisasC[1]- abcisasC[0]) * G[0];
    for (int i=1; i<k; i++) {
      O[i] = (3. * ( abcisasC[i+1] - abcisasC[i-1] )- O[i-1] ) * G[i];
    }
    O[k] = (3. * (abcisasC[k] - abcisasC[k-1] )-O[k-1] ) * G[k];

    //se hace derivada grado1
    derivate[k] = O[k];
    for (int i=k-1; i>=0; i=i-1) {
      derivate[i] = O[i] -G[i] * derivate[i+1];
    }
    
    //calculamos coeficientes
    for (int i=0; i<k; i++) {
      a[i] = abcisasC[i];
      b[i] = derivate[i];
      c[i] = 3. * ( abcisasC[ i + 1] - abcisasC[ i ] ) - 2. * derivate[ i ] - derivate[ i + 1 ];
      d[i] = 2. * (abcisasC[ i ] - abcisasC[ i + 1 ] ) + derivate[ i ] + derivate[ i + 1 ];
    }

    arreglo.add(0, a);
    arreglo.add(1, b);
    arreglo.add(2, c);
    arreglo.add(3, d);

    return arreglo;
  }

  public void drawcn() {
    float[] G;
    int level = 7;
    List<float[]> x;
    List<float[]> y; 
    List<float[]> z;
    G = new float[8];
    x = new ArrayList<float[]>();
    y = new ArrayList<float[]>();
    z = new ArrayList<float[]>();
    G[0] = 0.5;
    for (int i = 1; i <level; i++) {
      G[i] = 1. / (4. - G[i-1]);
    }
    G[level] = 1. / (2.- G[level-1]);

    for (int i = 0; i < 3; i ++) {

      float[] axis = new float[8];
      if (i == 0) {
        for (int j = 0; j < 8; j++)
          axis[j] = ctrlPoints.get(j).x();
        x = CalculateCN(axis, G, level);
      }
      if (i == 1) {
        for (int j = 0; j < 8; j++)
          axis[j] = ctrlPoints.get(j).y();
        y = CalculateCN(axis, G, level);
      }
      if (i == 2) {
        for (int j = 0; j < 8; j++)
          axis[j] = ctrlPoints.get(j).z();
        z = CalculateCN(axis, G, level);
      }
    }
    //se hacen los puntos
    float dt = 1. / numberOfPoints;
    for (int i=0; i<level + 1; i++) {
      for (float t = dt; t <=1; t+=dt) {
        stroke(0);
        float xp, yp, zp;
        xp = (x.get(0)[i] + x.get(1)[i]*t+x.get(2)[i]*t*t+x.get(3)[i]*t*t*t);
        yp = (y.get(0)[i]+y.get(1)[i]*t+y.get(2)[i]*t*t+y.get(3)[i]*t*t*t);
        zp = (z.get(0)[i]+z.get(1)[i]*t+z.get(2)[i]*t*t+z.get(3)[i]*t*t*t);
        point(xp, yp, zp);
      }
    }
  }
}
