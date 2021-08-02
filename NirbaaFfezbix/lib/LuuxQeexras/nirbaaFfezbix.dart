import "dart:io";

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;


void main(List<String> arg){
  int gcase = 25;
  int number = 4;
  int person = 7;
  int voice = 2;
  int voice2 = voice + 5;
  int mood = 7;
  int mood2 = mood + 6;
  int tense = 5;
  int aspect = 9;
  int infin = 1;

  int noun = gcase * number;
  int verb = person * number * voice * mood * tense * aspect + infin;
  int verb2 = person * number * voice2 * mood2 * tense * aspect + infin;

  String unit = "[通り]";

  String printer = """Nirbāghu' Ƣeznē'bixic
　　( 2 段ある項目は後者が用法込み、前者がそうではない)


名詞変化：$gcase × $number = $noun $unit
　格　：$gcase (cases)
　数　：$number (numbers)


動詞変化：$person × $number × $voice × $mood × $tense × $aspect + $infin = $verb $unit
　　　　　$person × $number × $voice2 × $mood2 × $tense × $aspect + $infin = $verb2 $unit
　人称：$person (persons)
　数　：$number (numbers)
　態　：$voice (vices)
　　　：$voice2 (voices)
　法　：$mood (moods)
　　　：$mood2 (moods)
　時制：$tense (tenses)
　相　：$aspect (aspects)
　不定詞：$infin (infins)""";

  if(arg[0]=="printer"){
    print(printer);
  }
  else if(arg[0]=="filer"){
    String filename = "ffezneehfbixic_grammer.txt";
    if(arg.length>1){
      filename = arg[1];
    }
    File file = File(filename);
    if(!(file.existsSync())){
      file.createSync();
    }
    file.openSync(mode:FileMode.write)..writeStringSync("$filename\n\n\n$printer")
                                      ..closeSync();
  }
  /*else if(arg[0]=="docs"){
    String filename = "ffezneehfbixic_grammer.pdf";
    if(arg.length>1){
      filename = arg[1];
    }
    File file = File(filename);
    if(!(file.existsSync())){
      file.createSync();
    }
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text("$filename\n\n\n$printer"),
        ); // Center
      })
    ); // Page
    pdf.save().then((data){file.writeAsBytesSync(data);});
  }*/
}