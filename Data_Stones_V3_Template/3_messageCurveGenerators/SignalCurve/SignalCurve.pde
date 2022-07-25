// How to get timestamp out of table
// for loop with each rows
// if pete change current Y
// if 


Table allConv;
String date;
PrintWriter output;
int maxRow;
long minTimeStamp;
int fileNameNumber;

int currentTimeStamp;
int currentX;
int currentY;

void setup ()
{

  allConv = loadTable("/Users/peteracnelson/Dropbox/Art_Applications/2018/asia_society_stones/alexis_version_3/4_data/backup.csv", "header");
  maxRow=allConv.getRowCount();
  output = createWriter("post/post.txt");

  fileNameNumber = 0;


  for (int i=0; i<maxRow; i++)

  {
    currentTimeStamp = allConv.getInt(i, "TIME_STAMP");

    if (allConv.getInt(i, "ADDRESS_DEVICE_ID") ==2)
    {
      currentX=allConv.getString(i, "BODY").length();
    } else
    { 
      currentY=allConv.getString(i, "BODY").length();
    }

    output.println(currentTimeStamp);
    output.println(currentX);
    output.println(currentY);

    //println(currentTimeStamp + " / " + allConv.getString(i, "BODY").length() + " / " + allConv.getInt(i, "ADDRESS_DEVICE_ID"));
  }

println("Process Over Dude!");
  output.flush();
  output.close();
}

void draw ()

{
}
