
String[] conversation;
char[] date = new char [3000];

int pos = 0;
int timeStamp = 0;

int maxMessages;

int origin=8201402; // ToDo - calculate it based on the final timestamp to invert the order

int currentX;
int currentY;
int currentTimeStamp;
int month;
int currentPos;
PrintWriter output;

boolean isTheSame=false;

void setup()
{
  conversation = loadStrings("facebookComplete.txt");

  maxMessages = conversation.length-2;

  output = createWriter("post/post.txt");

  for (int i=10; i<maxMessages; i++) //To Do --> Clean the Facebook first name files to make sure the first time stamp is not black
  {

    if (isGood(i) && conversation[i].equals("Peter Nelson"))
    {

      processTimeStamp(i-1); //line before "Peter Nelson" : the date
      currentY = conversation[i+2].length();
      output.println(timeStamp-origin);
      output.println(currentX);
      output.println(currentY);
    }


    if (isGood(i) && conversation[i].equals("Bogna M Konior"))
    {

      processTimeStamp(i-1); // The line before "Bogna Konior" : the date
      currentX = conversation[i+2].length();
      output.println(timeStamp-origin);
      output.println(currentX);
      output.println(currentY);
    }
  }

  output.flush();
  output.close();


  conversation = loadStrings("post/post.txt"); // loads the file we just created, so no further adjustments to line gaps

  output = createWriter("post/post.txt");


  for (int i=0; i<conversation.length-3; i+=3)
  {

    currentX=0;
    currentY=0;

    currentPos = i;
    if (Integer.parseInt(conversation[currentPos+3]) != Integer.parseInt(conversation[currentPos]))
    {
      currentTimeStamp = Integer.parseInt(conversation[i]);
      currentX = Integer.parseInt(conversation[i+1]);
      currentY =  Integer.parseInt(conversation[i+2]);
      // println("NOT"); //for debug
    } else
    {
      //  println("same"); // for debug
      isTheSame=true;

      currentTimeStamp = Integer.parseInt(conversation[i]);

      while (isTheSame)
      {
        currentX += Integer.parseInt(conversation[currentPos+1]);
        currentY += Integer.parseInt(conversation[currentPos+2]);

        if (Integer.parseInt(conversation[currentPos+3]) != Integer.parseInt(conversation[currentPos]))
        {
          isTheSame=false;
        }
        currentPos += 3;
      }
    }

    i=currentPos;

    output.println(currentTimeStamp);
    output.println(currentX);
    output.println(currentY);
  }

  output.flush();
  output.close();
}



void draw ()

{
}
