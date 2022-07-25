Table allConv;
String[] conv;
PrintWriter output;

int fileNameNumber;

void setup()
{

  allConv= loadTable("backup.csv", "header");

  println(allConv.getRowCount() + "total rows in table");


  fileNameNumber = 0;
  for (TableRow row : allConv.findRows("1", "ADDRESS_DEVICE_ID"))
  {
    fileNameNumber++;
      output = createWriter("pete/Pete" + nf(fileNameNumber, 5)+".txt");
    output.println(row.getString("BODY"));
    output.flush();
    output.close();
  }

  fileNameNumber = 0;
  for (TableRow row : allConv.findRows("2", "ADDRESS_DEVICE_ID")) {
    fileNameNumber++;
    output = createWriter("bogna/Bogna"+nf(fileNameNumber, 5)+".txt");
    output.println(row.getString("BODY"));
    output.flush();
    output.close();
  }
}


void draw ()

{
}
