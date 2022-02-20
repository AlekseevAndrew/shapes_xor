String oneFig[]={};
String twoFig[]={};

void setup() {
  size(1000, 1000);
  noStroke();
}

void draw() {
  background(255);
  drawDots(oneFig, #0000FF);
  drawDots(twoFig, #FF0000);
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    oneFig = append(oneFig, str(mouseX)+":"+str(mouseY));
  } else if (mouseButton == RIGHT) {
    twoFig = append(twoFig, str(mouseX)+":"+str(mouseY));
  }
}

void drawDots(String fig[], color col) {
  fill(col);
  for (int i = 0; i < fig.length; i++) {
    String arr[] = fig[i].split(":");
    circle(float(int(arr[0])), float(int(arr[1])), 10);
    stroke(col);
    if (i>0) {
      String arr2[] = fig[i-1].split(":");
      line(float(int(arr[0])), float(int(arr[1])), float(int(arr2[0])), float(int(arr2[1])));
    } else {
      String arr1[] = fig[0].split(":");
      String arr2[] = fig[fig.length-1].split(":");
      line(float(int(arr1[0])), float(int(arr1[1])), float(int(arr2[0])), float(int(arr2[1])));
    }
    noStroke();
  }
}

String[] getVectors(String fig1[], String fig2[]) {
  String Fig[]={};
  for (int i = 0; i < fig1.length; i++) {
    for (int f = 0; f < fig2.length; f++) {
    }
  }
  return Fig;
}


String cross(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    float n;
    if (y2 - y1 != 0) {  // a(y)
        float q = (x2 - x1) / (y1 - y2);   
        float sn = (x3 - x4) + (y3 - y4) * q; if (sn == 0) { return null; }  // c(x) + c(y)*q
        float fn = (x3 - x1) + (y3 - y1) * q;   // b(x) + b(y)*q
        n = fn / sn;
    }
    else {
        if ((y3 - y4)==0) { return null; }  // b(y)
        n = (y3 - y1) / (y3 - y4);   // c(y)/b(y)
    }
    return str(x3 + (x4 - x3) * n)+" "+str(y3 + (y4 - y3) * n);
}
