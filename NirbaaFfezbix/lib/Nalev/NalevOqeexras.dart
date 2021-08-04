class NalevOqeexras {
  List<String> _nalevEvezak=["","","","","","","","","","","","","","","","",];
  List<int> _nalevValueEvezak=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
  String _nalevSufDefault="";
  int _nalevSufValueDefault=17;
    String _nalevSufDefaultGe="";
  int _nalevSufValueDefaultGe=-1;
  List<String> _nalevSufEvezak=["","","","","","","","",];
  List<int> _nalevSufValueEvezak=[0,0,0,0,0,0,0,0,];

  NalevOqeexras();

  String cuir2aquzmyan(int cuirNum){
  }
  int aquzmyan2cuir(String aquzmyanNum){
    List<String> splited = aquzmyanNum.split("-").map((String str)=>str.split("ai")).expand((String i)=>i).toList();
    List<int> numbre = splited.map((String str)=>1).toList();
    splited.indexedMap((int ind, String str){
      this._nalevSufEvezak.map((String nel){
        if(str.endWith(nel)){
          numbre[ind] *= this._nalevSufValueEvezak[this._nalevSufEvezak.indexOf(nel)];
          str = str.subString(0,str.length-nel.length);
        }
        numbre[ind] *= this._aquzmyanSuf(str,1);
        return str;
      });
      this._nalevEvezak.map((String nel){
        if(str == nel){
          numbre[ind] *= this._nalevValueEvezak[this._nalevEvezak.indexOf(nel)];
          str = "";
        }
        return str;
      });
    }).toList();
    return numbre.reduce((int a, int b)=>a+b);
  }
  int _aquzmyanSuf(String aquzmyanNum,int numbre){
    if(aquzmyanNum.endWith(this._nalevSufDefault)){
      numbre *= this._nalevSufValueDefault;
      aquzmyanNum = aquzmyanNum.subString(0,aquzmyanNum.length-this._nalevSufDefault.length);
      return this._aquzmyanSuf(aquzmyanNum,numbre);
    }
    else{
      return numbre;
    }
  }
}
