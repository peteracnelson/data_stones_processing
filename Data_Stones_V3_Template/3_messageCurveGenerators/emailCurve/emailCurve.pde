import java.io.*;

String [] conversation;
PrintWriter output;

boolean done=false;
char[] date = new char[30];
int pos = 0;
int timeStamp = 0;

int origin = 0;

int currentTimeStamp;
int currentBog;
int currentPet;

void setup()
{

  File bognaFile = new File("/Users/peteracnelson/Dropbox/Art_Applications/2018/asia_society_stones/alexis_version_3/3_messageCurveGenerators/EmailCurve/emailCurve/bognaSend/");
  File peterFile = new File("/Users/peteracnelson/Dropbox/Art_Applications/2018/asia_society_stones/alexis_version_3/3_messageCurveGenerators/EmailCurve/emailCurve/peterSend/");



  String[] list = bognaFile.list(); //array of file name
  list = sort(list);

  for (int i = 0; i<list.length; i++)                         // for every file name
  {
    output = createWriter("bogna/Bogna"+nf(i, 5)+ ".txt");   //create a bognaXXXXX.txt
    conversation = loadStrings("bognaSend/" +list[i]);   //load the mail

    int lengthMessage=0;
    int val =0;
    done=false;

    for (int j=val; j<conversation.length; j++) // for every line of the email
    {
      lengthMessage+=conversation[j].length()+1;

      if (conversation[j].indexOf("Date")==0 && !done)
      {
        for (int k=6; k<conversation[j].length(); k++) //fill date[] by date characters
        {
          date[k]=conversation[j].charAt(k);
          //  print(date[k]);
        }
        done = true; // a;ready got a date, don't process it until the next mail
      }
    }

    pos = 0;
    timeStamp = 0;

    processTimeStamp();


    if (origin==0)
    {
      origin=timeStamp;
    }


    output.println(timeStamp-origin);     // final one
    output.println(lengthMessage);

    output.flush();
    output.close();
  }






  list = peterFile.list(); //array of file name
  list = sort(list);
  origin = 0;

  for (int i = 0; i<list.length; i++)                         // for every file name
  {
    output = createWriter("peter/Peter"+nf(i, 5)+ ".txt");   //create a bognaXXXXX.txt
    conversation = loadStrings("peterSend/" +list[i]);   //load the mail

    int lengthMessage=0;
    int val =0;
    done=false;

    for (int j=val; j<conversation.length; j++) // for every line of the email
    {
      lengthMessage+=conversation[j].length()+1;

      if (conversation[j].indexOf("Date")==0 && !done)
      {
        for (int k=6; k<conversation[j].length(); k++) //fill date[] by date characters
        {
          date[k]=conversation[j].charAt(k);
          //  print(date[k]);
        }
        done = true; // already got a date, don't process it until the next mail
      }
    }

    pos = 0;
    timeStamp = 0;

    processTimeStamp();

     if (origin==0)
    {
      origin=timeStamp;
    }
    
    output.println(timeStamp-origin);     // final one
    output.println(lengthMessage);

    output.flush();
    output.close();
  }
}

void draw () {
}
