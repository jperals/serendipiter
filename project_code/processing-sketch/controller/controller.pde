import controlP5.*;
import netP5.*;
import oscP5.*;

ControlP5 cp5;
OscP5 oscP5;
NetAddress remoteAddress;

boolean leaveTrace, drawPoints, drawLines, drawDelaunay;
color backgroundColor;
float attractionValue, minAttraction, maxAttraction;
int numberOfArtifacts, minNumberOfArtifacts, maxNumberOfArtifacts;
Options options;

void setup() {
  size(400, 640);
  noStroke();
  cp5 = new ControlP5(this);
  oscP5 = new OscP5(this, MY_PORT);
  remoteAddress = new NetAddress(OTHER_IP, OTHER_PORT);
  options = new Options();
  addControls(cp5, options);
}

void draw() {
}

