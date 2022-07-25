
String[] conv;
PrintWriter output;
char[] date = new char[30];
int timeStamp;
int origin = 0;
int currentX;
int currentY;
int maxMessages = 5745;

int[] bogValues = new int[maxMessages*2];
int[] petValues = new int[maxMessages*2];

int longStuff=100000000;

int[] bogFixed = new int[longStuff];
int[] petFixed = new int [longStuff];


void setup ()
{
  conv = loadStrings("WhatsApp Chat with Bogna M Konior.txt");
  output = createWriter("post/post.txt");
  //print(conv.length); //this tells us how long maxMessages should be

  for (int i=0; i<maxMessages; i++)
  {

    if (isGood(i) && conv[i].indexOf("Bogna M Konior")>0)
    {
      //  output.println(conv[i].length() + " bog :");
      currentX = conv[i].length();
      processTimeStamp(i);
      bogValues[i*2] = timeStamp;
      bogValues[i*2+1]=conv[i].length();

      //output.println("BogTime " + timeStamp);
      //output.println("BogX: " + currentX);
      //output.println("BogY: " + currentY);
    }

    if (isGood(i) && conv[i].indexOf("peteracnelson")>0)

    {
      // output.println(conv[i].length() + " pet :");

      currentY = conv[i].length();
      processTimeStamp(i);
      petValues[i*2] = timeStamp;
      petValues[i*2+1]=conv[i].length();
      //output.println("PetTime " + timeStamp);
      // output.println("PetX: " + currentX);
      // output.println("PetY: " + currentY);
    }
  }

  for (int i=0; i< maxMessages; i++)
  {
    bogFixed[bogValues[i*2]] += bogValues[i*2+1];
    petFixed[petValues[i*2]] += petValues[i*2+1];
  }

  for (int i=0; i<longStuff; i++)

  {
    if ( (petFixed[i] !=0) || (bogFixed[i] !=0))
    {
      if (bogFixed[i] !=0)
        currentX=bogFixed[i];

      if (petFixed[i] !=0)
        currentY=petFixed[i];
        
        output.println(i);
        output.println(currentX);
        output.println(currentY);
    }
  }

  output.flush();
  output.close();
}

void draw ()

{
}
