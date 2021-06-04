

class Converter{

  List<List<String>> numerics =
    [
      ["zero","um","dois","tres","quatro","cinco","seis","sete","oito","nove"],
      ["dez","onze","doze","treze","catorze","quinze","dezeseis","dezessete","dezoito","dezanove"],
      ["","","vinte","trinta","quarenta","cinquenta","sessenta","setenta","oitenta","noventa"],
      ["","cem","duzentos","trezentos","quatrocentos","quinhentos","seissentos","setesentos","oitocentos","novecentos"],
    ];
  List<int> divNr = [1,1,10,100,1000,10000,10000,10000,10000,10000,10000,10000];
  List<String> letter = List();
  String xxx(String nr){
    int number = int.parse(nr);

    print(processer(parseList(number)));
    return "a";
  }

  String processer(List<int> parc){

    if(parc.length==1){
      return  numerics[0][parc[0]];
    }else if(parc.length==2){
      return   processTwo(parc);
    }else if(parc.length==3){
      return  processThree(parc);
    }
    else if(parc.length==4){
      return  processFour(parc);
    }else if(parc.length==5){
      return  processFive(parc);
    }

  }
  String mainVerification(List<int> parc){
    int number = sum(parc);
    return number%divNr[parc.length]==0?(numerics[parc.length][(number/divNr[parc.length]).toInt()]):null;

  }

  String processTwo(List<int> parc){
    if(mainVerification(parc)!=null){return mainVerification(parc);}
    if(parc[0]==1){return numerics[1][parc[1]];} else{ return numerics[2][parc[0]]+" e "+numerics[0][parc[1]];}
  }
  String processThree(List<int> parc){
   if(mainVerification(parc)!=null){return mainVerification(parc);}
   return ((parc[0]==1?"cento e ":(numerics[3][parc[0]]+ " e "))+ processTwo(parc.sublist(1,parc.length)));
  }
  String processFour(List<int> parc){
    String x = parc[0]==1?"mil ":(numerics[0][parc[0]]+" mil ");
    return x +  processThree(parc.sublist(1,parc.length));
  }
  String processFive(List<int> parc){
    String x= (parc[0]==1?numerics[1][parc[1]]:(numerics[2][parc[0]])+(parc[1]==0?"":" e "+numerics[0][parc[1]]))+ " mil ";
    return (x+  processThree(parc.sublist(2,parc.length)));
  }

  List<int> parseList(int nr){
    List<int> parc = List();
    for(int i=0;i<nr.toString().length;i++){
      parc.add(int.parse(nr.toString()[i]));
    }
    return parc;
  }
  int sum(List<int> parc){
    String x='' ;
    for (int i=0;i<parc.length;i++){
      x = x+(parc[i]).toString();
    }
    return int.parse(x);
  }
}