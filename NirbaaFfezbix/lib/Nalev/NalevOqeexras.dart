class NalevOqeexras {
  List<String> nalevEvezak=[];
  List<int> nalevValueEvezak=[];
  String _nalevSufDefault="";
  int _nalevSufValueDefault=17;
  List<String> _nalevSufEvezak=["","","","","","","","",];
  List<int> _nalevSufValueEvezak=[0,0,0,0,0,0,0,0,];

  NalevOqeexras();

  String dec2sepdec(int decNum){
  }
  int sepdec2dec(String sepNum){
    List<String> splited = sepNum.split("-").map((String str)=>str.split("ai")).expand((String i)=>i).toList();
    List<int> numbre = splited.map((String str)=>1).toList();
    splited.indexedMap((int ind, String str){
      this._nalevSufEvezak.map((String nel){
        if(str.endWith(nel)){
          numbre[ind] *= this._nalevSufValueEvezak[this._nalevSufEvezak.indexOf(nel)];
          str = str.subString(0,str.length-nel.length);
        }
        numbre[ind] *= this._sepdecSuf(str,1);
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
  int _sepdecSuf(String sepNum,int numbre){
    if(sepNum.endWith(this._nalevSufDefault)){
      numbre *= this._nalevSufValueDefault;
      sepNum = sepNum.subString(0,sepNum.length-this._nalevSufDefault.length);
      return this._sepdecSuf(sepNum,numbre);
    }
    else{
      return numbre;
    }
  }
}
