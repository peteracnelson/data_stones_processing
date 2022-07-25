boolean isGood(int i)
{

  String message;                                              // this string drives the weblink removal line

  if (conversation[i+1].length()>4)
  {
    message = conversation[i+1].substring(0, 4);
  } else
  {
    message="";
  }

  if (
    !conversation[i+2].equals("")                                 // remove blank messages
    && !conversation[i+2].equals("Click for audio")             // click for audio
    && !conversation[i+2].equals("You sent an attachment.")     // remove this message
    && !conversation[i+2].equals("Click for video:")           // remove this message
    && !message.equals("http")                                  // removes weblinks


    )
  {
    return true;
  } else
    return false;
}
