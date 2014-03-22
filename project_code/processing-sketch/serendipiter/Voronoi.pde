public class Voronoi {
  PVector artifactPosition;
  Voronoi(PVector p) {
    artifactPosition = p;
  }
  public class slopeComparator implements Comparator<PVector> {
      public int compare(PVector p1, PVector p2) {
        PVector d1 = new PVector(p1.x-artifactPosition.x, p1.y-artifactPosition.y);
        PVector d2 = new PVector(p2.x-artifactPosition.x, p2.y-artifactPosition.y);
        float h1 = d1.heading();
        float h2 = d2.heading();
        if(h1 > h2) return 1;
        if(h1 < h2) return -1;
        return 0;
      }
  }
  public ArrayList<PVector> getCircumcenters(ArrayList<DelaunayTriangle> triangles) {
    ArrayList<PVector> points = new ArrayList<PVector>();
    int nTriangles = triangles.size();
    for(int i = 0; i < nTriangles; i++) {
      DelaunayTriangle t = triangles.get(i);
      if(t == null) {
        println("triangle is null");
        continue;
      }
      PVector origin1 = new PVector((t.p1.x + t.p2.x)/2, (t.p1.y + t.p2.y)/2);
      PVector samplePoint1 = new PVector(origin1.x + (origin1.y - t.p1.y), origin1.y - (origin1.x - t.p1.x));
      PVector origin2 = new PVector((t.p2.x + t.p3.x)/2, (t.p2.y + t.p3.y)/2);
      PVector samplePoint2 = new PVector(origin2.x + (origin2.y - t.p2.y), origin2.y - (origin2.x - t.p2.x));
      PVector circumCenter = lineIntersection(origin1.x, origin1.y, samplePoint1.x, samplePoint1.y, origin2.x, origin2.y, samplePoint2.x, samplePoint2.y);
      points.add(new PVector(circumCenter.x, circumCenter.y));
    }
    Collections.sort(points, new slopeComparator());
    return points;
  }
}
