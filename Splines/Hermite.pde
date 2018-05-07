class HermiteCurve {

List<PVector> cPoints;
List<PVector> tPoints;
int SEGMENT_COUNT = 50;
float t = 0;

  HermiteCurve (List<PVector> cPoints){
      this.tPoints = cPoints;
      this.cPoints = cPoints;
  }

  PVector calculateHermitePoint(float t,PVector p0, PVector p1, PVector m0, PVector m1){
      PVector firstTerm = PVector.mult( p0, 2*pow(t,3) - 3*pow(t,2) + 1);
      PVector secondTerm = firstTerm.add(PVector.mult( p1, -2*pow(t,3) + 3*pow(t,2) ));
      PVector thirdTerm = secondTerm.add(PVector.mult( m0, pow(t,3) - 2*pow(t,2) + t ));
      PVector fourthTerm = thirdTerm.add(PVector.mult( m1, pow(t,3) - pow(t,2) ));
      return fourthTerm;

  }

  void drawHermiteCurve(){



    for(int i=1; i < cPoints.size() -1; i++){

      PVector current = cPoints.get(i);
      PVector next = cPoints.get(i+1);
      PVector tangent_current = PVector.sub(tPoints.get(i+1), current );
      PVector tangent_next = PVector.sub(tPoints.get(i-1), next );

        PVector q0 = calculateHermitePoint(0, current, next, tangent_current, tangent_next);
        int stepts;
        for(stepts = 0; stepts<= SEGMENT_COUNT; stepts++ ){
          float t = stepts / (float) SEGMENT_COUNT;
          PVector q1 = calculateHermitePoint(t, current, next,  tangent_current, tangent_next);
          stroke(0);
          line(q0.x, q0.y,q0.z, q1.x, q1.y,q1.z);
          q0=q1;

        }
    }


  }
}
