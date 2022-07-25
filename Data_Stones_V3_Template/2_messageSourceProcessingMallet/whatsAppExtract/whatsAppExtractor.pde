String[] conv;
char[] date = new char[30];

void setup()
{
  conv= loadStrings("whatsappShort.txt");


  for (int j = 0; j< 30; j++)

  {
    for (int i=0; i<20; i++)
      date[i]=conv[j].charAt(i);


    /*
0-255 = 00000000 - 11111111
     0-127 =  0000000 -  1111111
     1 00000001
     0000001
     127  8 digit : 01111111
     7 digit :  1111111
     
     128  8 digitt : 10000000
     129             10000001
     130             10000010
     */


    int pos=0;
    int timeStamp=0;         //    1/    12/  1*10 + 2*1 = 12

    //MONTH
    while (date[pos] != '/') //look for the first slasch
    {
      if (date[pos+1] != '/')
      {                                       // 60 minutes 24 hours 30 days
        timeStamp=((date[pos]-48)*10+date[pos+1]-48)*60*24*30;
        pos++;
      } else
        timeStamp=(int(date[pos]-48))*60*24*30;   //ASCII fix : -48

 //     println(timeStamp);
      pos++;
    }
    pos++;    //Jump the slash '/'

    //DAY
    while (date[pos] != '/') //look for the second slasch
    {
      if (date[pos+1] != '/')
      {
        timeStamp += ((date[pos]-48)*10+date[pos+1]-48)*60*24;
        pos++;
      } else
        timeStamp += (int(date[pos]-48))*60*24;   //ASCII fix : -48
   //   println(timeStamp);
      pos++;
    }
    pos++;    //Jump the slash '/'


    //YEAR
    timeStamp += ((date[pos]-48)*10+date[pos+1]-48)*60*24*30*12; //assume always 2 digit
 //   println(timeStamp);
//    println();
    pos=pos+4;   //jump comma and space

    //HOUR
    while (date[pos] != ':') //look for the semi colon
    {
      if (date[pos+1] != ':')
      {
        timeStamp += ((date[pos]-48)*10+date[pos+1]-48)*60;
        pos++;
      } else
        timeStamp += (int(date[pos]-48))*60;   //ASCII fix : -48
  //    println(timeStamp);
      pos++;
    }
  //  println();
    pos++;

    //MINUTE
    timeStamp += ((date[pos]-48)*10+date[pos+1]-48); //assume always 2 digit
  //  println(timeStamp);

    pos++;
    pos++;
    pos++;  // jump to A or P

    //PM OR AM
    if (date[pos]=='P')
      timeStamp += 60*12;
   }
}

void draw()
{
}
