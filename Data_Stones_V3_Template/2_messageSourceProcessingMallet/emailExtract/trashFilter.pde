boolean isGood(int index)

{

  if (

    conversation[index].indexOf(">")!=0 // the first character is not
    &&
    conversation[index].indexOf("http://www.bognamk.com/")<0 // it is not...
    &&
    conversation[index].indexOf("www.peteracnelson.com")<0 // it is not...
    &&
    conversation[index].indexOf("bognakonior@gmail.com")<0 // it is not...
    &&
    conversation[index].indexOf("peteracnelson@yahoo.com.au")<0 // it is not...
    &&
    conversation[index].indexOf("From:")<0 // it is not...
    &&
    conversation[index].indexOf("Date:")<0 // it is not...
    &&
    conversation[index].indexOf("Subject:")<0 // it is not...
    &&
    conversation[index].indexOf("Forwarded message")<0 // it is not...
    &&
    conversation[index].indexOf("____")<0 // it is not...
    &&
    conversation[index].indexOf("--")<0 // it is not
    &&
    conversation[index].indexOf("KB")<0 // it is not... 
    &&
    conversation[index].indexOf("Attachments:")<0 // it is not...
    &&
    conversation[index].indexOf("bobo kay")<0 // it is not
    &&
    conversation[index].indexOf("To:")<0 // it is not
    &&
    conversation[index].indexOf("News:::: www.bognamk.com")<0
    && 
    conversation[index].indexOf("Lecturer in New Media and Digital Culture, University of Amsterdam")<0
    &&
    conversation[index].indexOf("Research Fellow, International Research Institute for Cultural Techniques and Media Philosophy")<0
    &&
    conversation[index].indexOf("Media and Technology Editor, Hong Kong Review of Books ")<0
    &&
    conversation[index].indexOf("Editor, Oraxiom: A Journal of Non-Philosophy ")<0
    && 
    conversation[index].indexOf("@bognamk")<0
    
    



    )
  {
    return true;
  } else
    return false;
}
