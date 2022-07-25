

/*

 set email curve scale in Blender: X  Y   Z
 
 */
import java.io.*;
import processing.dxf.*;

int maxLength = 50000; // maximum number of messages between the different message sources


String[] emailCurveString;
String[] fbCurveString;
String [] signalCurveString;
String[] whatsappCurveString;
int [] mainCurve = new int[maxLength*3]; // max number of vertices. Will need to be adjusted

int[] emailCurve = new int[maxLength*3]; // max number of vertices. Will need to be adjusted
int [] fbCurve = new int[maxLength*3]; // max number of vertices. Will need to be adjusted
int [] signalCurve = new int[maxLength*3]; // max number of vertices. Will need to be adjusted
int[] whatsappCurve = new int[maxLength*3]; // max number of vertices. Will need to be adjusted

boolean record = true;


void setup ()
{
  size(100, 100, P3D);
  emailCurveString = loadStrings("/Users/peteracnelson/Dropbox/Art_Applications/2018/asia_society_stones/alexis_version_3/3_messageCurveGenerators/EmailCurve/emailCurvePost/emailCurvePost/post/post.txt");
  fbCurveString = loadStrings("/Users/peteracnelson/Dropbox/Art_Applications/2018/asia_society_stones/alexis_version_3/3_messageCurveGenerators/FacebookCurve/FacebookCurve/post/post.txt");
  signalCurveString = loadStrings("/Users/peteracnelson/Dropbox/Art_Applications/2018/asia_society_stones/alexis_version_3/3_messageCurveGenerators/SignalCurve/post/post.txt");
  whatsappCurveString = loadStrings("/Users/peteracnelson/Dropbox/Art_Applications/2018/asia_society_stones/alexis_version_3/3_messageCurveGenerators/WhatsAppCurve/WhatsAppCurve/post/post.txt");

  for (int i=0; i<emailCurveString.length/3; i++)
  {
    emailCurve[i*3]=Integer.parseInt(emailCurveString[i*3]);
    emailCurve[i*3+1]=Integer.parseInt(emailCurveString[i*3+1]);
    emailCurve[i*3+2]=Integer.parseInt(emailCurveString[i*3+2]);
  }

  emailCurve[0]=1;

  for (int i=0; i<fbCurveString.length/3; i++)
  {
    fbCurve[i*3]=Integer.parseInt(fbCurveString[i*3]);
    fbCurve[i*3+1]=Integer.parseInt(fbCurveString[i*3+1]);
    fbCurve[i*3+2]=Integer.parseInt(fbCurveString[i*3+2]);
  }

  fbCurve[0]=1;

  for (int i=0; i<signalCurveString.length/3; i++)
  {
    signalCurve[i*3]=Integer.parseInt(signalCurveString[i*3]);
    signalCurve[i*3+1]=Integer.parseInt(signalCurveString[i*3+1]);
    signalCurve[i*3+2]=Integer.parseInt(signalCurveString[i*3+2]);
  }

  signalCurve[0]=1;


  for (int i=0; i<whatsappCurveString.length/3; i++)
  {
    whatsappCurve[i*3]=Integer.parseInt(whatsappCurveString[i*3]);
    whatsappCurve[i*3+1]=Integer.parseInt(whatsappCurveString[i*3+1]);
    whatsappCurve[i*3+2]=Integer.parseInt(whatsappCurveString[i*3+2]);
  }

  whatsappCurve[0]=1;







  print(emailCurveString.length + " " + fbCurveString.length + " " + signalCurveString.length + " " + whatsappCurveString.length); //print how many messages so we know what maxMessages should be



  //*************    fill the mainCurve array **************************

  for (int i=0; i<maxLength*3; i++)
  {
  //  mainCurve[i] = fbCurve[i]; // which curve will be output
  //   mainCurve[i]=emailCurve[i]; // if you want to output emailCurve
     mainCurve[i] = signalCurve[i];
   //  mainCurve[i] = whatsappCurve[i]; // which curve will be output
  }
  noLoop();                                // run the loop draw only once
}

void draw ()
{

  noFill();
  strokeWeight(50);
  background(0);
  lights();

  if (record)
  {                                                      //record the shape on the first frame
   // beginRaw(DXF, "outputWhatsapp.dxf");
  //  beginRaw(DXF, "outputFB.dxf");
    beginRaw(DXF, "outputSignal.dxf");
  //  beginRaw(DXF, "outputEmail.dxf");
  }

  int maxVert;

 // maxVert = fbCurveString.length/3;
 // maxVert = emailCurveString.length/3;
   maxVert = signalCurveString.length/3;
  //  maxVert = whatsappCurveString.length/3;


  beginShape();
  {
    for (int i=1; i<maxVert; i++)
    {

      vertex(mainCurve[i*3+1], mainCurve[i*3+2], mainCurve[i*3]);
      
      //  println("x : " + mainCurve[i*3+1] + " / y : " + mainCurve[i*3+2]*100 + " / z : " + mainCurve[i*3]);
    }

    endShape();
  }

  if (record)
  {
    endRaw();
    record=false;
  }
}
