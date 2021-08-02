class NumeralTrans {
  List<String> numeralList=[];
  List<int> numeralValueList=[];
  String _numeralSufDefault="";
  int _numeralSufValueDefault=17;
  List<String> _numeralSufList=["","","","","","","","",];
  List<int> _numeralSufValueList=[0,0,0,0,0,0,0,0,];
  NumeralTrans();
  String dec2sepdec(int decNum){
  }
  int sepdec2dec(String sepNum){
    List<String> splited = sepNum.split("-").map((String str)=>str.split("ai")).expand((String i)=>i).toList();
    List<int> numbre = splited.map((String str)=>1).toList();
    splited.indexedMap((int ind, String str){
      this._numeralSufList.map((String nel){
        if(str.endWith(nel)){
          numbre[ind] *= this._numeralSufValueList[this._numeralSufList.indexOf(nel)];
          str = str.subString(0,str.length-nel.length);
        }
        numbre[ind] *= this._sepdecSuf(str,1);
        return str;
      });
      this._numeralList.map((String nel){
        if(str == nel){
          numbre[ind] *= this._numeralValueList[this._numeralList.indexOf(nel)];
          str = "";
        }
        return str;
      });
    }).toList();
    return numbre.reduce((int a, int b)=>a+b);
  }
  int _sepdecSuf(String sepNum,int numbre){
    if(sepNum.endWith(this._numeralSufDefault)){
      numbre *= this._numeralSufValueDefault;
      sepNum = sepNum.subString(0,sepNum.length-this._numeralSufDefault.length);
      return this._sepdecSuf(sepNum,numbre);
    }
    else{
      return numbre;
    }
  }
}
