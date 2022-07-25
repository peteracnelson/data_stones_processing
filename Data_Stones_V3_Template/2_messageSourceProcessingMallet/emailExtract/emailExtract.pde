String [] conversation;
PrintWriter output;
import java.io.*;

void setup()
{

  File f = new File("/Users/peteracnelson/Dropbox/Art_Applications/2018/asia_society_stones/alexis_version_3/2_messageSourceProcessingMallet/emailExtract/emailExtract/bognaSend/");
  File q = new File("/Users/peteracnelson/Dropbox/Art_Applications/2018/asia_society_stones/alexis_version_3/2_messageSourceProcessingMallet/emailExtract/emailExtract/peterSend/");
  println(q);
  println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  println(f);



  String[] list = f.list(); //array of file name
  list = sort(list);
  for (String fileName : list)
    println(fileName);
  for (int i = 0; i<list.length; i++)                         // for every file name
  {
    output = createWriter("bogna/Bogna"+nf(i, 5)+ ".txt");   //create a bognaXXXXX.txt
    conversation = loadStrings("bognaSend/" +list[i]);   //load the mail
    int val =0;
    // while (!conversation[val].equals("")) // removes the first lines waiting for the blank line
    //   val ++;                              // looking

    for (int j=val; j<conversation.length; j++) // for every line of the email
    {
      if (isGood(j))
        output.println(conversation[j]);          // print it on the txt file
    }

    output.flush();
    output.close();
  }
  
  list = q.list(); //array of file name
  list = sort(list);
  for (String fileName : list)
    println(fileName);
  for (int i = 0; i<list.length; i++)                         // for every file name
  {
    output = createWriter("peter/Peter"+nf(i, 5)+ ".txt");   //create a bognaXXXXX.txt
    conversation = loadStrings("peterSend/" +list[i]);   //load the mail
    int val =0;
    // while (!conversation[val].equals("")) // removes the first lines waiting for the blank line
    //   val ++;                              // looking

    for (int j=val; j<conversation.length; j++) // for every line of the email
    {
      if (isGood(j))
        output.println(conversation[j]);          // print it on the txt file
    }

    output.flush();
    output.close();
  }
  
  
}


void draw ()
{
}
