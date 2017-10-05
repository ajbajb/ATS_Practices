/*
You can call beginPDF(); or beginPDF("myFilename"); to start PDF recording
then call endPDF(); to write the file to the sketch folder.
*/

void beginPDF(String name) {
  if (name.equals("")) {
    name = "OUTPUT";
  }
  beginRecord(PDF, name+"_"+month()+"."+day()+"."+year()+"_"+hour()+"-"+minute()+"-"+second()+".pdf");
}

void beginPDF() {
  beginPDF("");
}

void endPDF() {
  endRecord();
}