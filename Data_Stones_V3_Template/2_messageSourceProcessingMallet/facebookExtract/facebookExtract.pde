String[] conversation;
PrintWriter output;

int maxMessages;


void setup()
{

  conversation = loadStrings("facebookComplete.txt");
  println(conversation.length);
  maxMessages = conversation.length-10;
  
  print("Let's get started");

  for (int i=0; i<maxMessages; i++) 
  {
    if (isGood(i) && conversation[i].equals("Peter Nelson"))
    {
      output = createWriter("pete/Pete"+nf(i, 5)+".txt");
      output.println(conversation[i+2]);
      output.flush();
      output.close();
    }


    if (isGood(i) && conversation[i].equals("Bogna M Konior"))  
    {
      output = createWriter("bogna/Bogna"+nf(i, 5)+".txt");
      output.println(conversation[i+2]);
      output.flush();
      output.close();
    }
  }
  println();
  println("yay, you made it!");
}
void draw ()
{
}
