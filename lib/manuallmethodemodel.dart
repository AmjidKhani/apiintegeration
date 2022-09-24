class BitCoinApiModel
{
  Time?  time;
String? disclaimer;
String? chartName;
BPII? bpii;
BitCoinApiModel({
  this.time,
  this.disclaimer,
  this.chartName,
  this.bpii
});
factory BitCoinApiModel.fromjson(Map<String,dynamic> parejson)
{
  return BitCoinApiModel(
    time:  Time.fromjson(parejson["time"])  , //,
    disclaimer: parejson["disclaimer"],
      chartName:parejson["chartName"],
    bpii: BPII.fromjson(parejson["bpi"]),
  );
}
}
class BPII{
  ERU? usd;
  ERU? gbp;
  ERU? eru;
  BPII({
    this.usd,
    this.gbp,
    this.eru

});
  factory BPII.fromjson(Map<String ,dynamic> parsejson){
    return BPII(
      usd:ERU.fromjson(parsejson["USD"]) ,
      gbp:ERU.fromjson( parsejson["GBP"]),
      eru:ERU.fromjson(parsejson["EUR"])
    );
  }

}
class ERU{
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rate_float;

  ERU({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rate_float
});
 factory ERU.fromjson(Map<String,dynamic> parsejson)
 {
   return ERU(
     code: parsejson["code"],
     symbol:  parsejson["symbol"],
     rate:  parsejson["rate"],
     description:  parsejson["description"],
     rate_float:  parsejson["rate_float"],
   );
 }

}

class Time{
  String? updated;
  DateTime? updatedISO;
  String? updateduk;
  Time({
    this.updated,
    this.updatedISO,
    this.updateduk

});
  factory Time.fromjson(Map<String,dynamic> parsejson)
  {
    return Time(
      updated: parsejson["updated"],
      updatedISO:DateTime.parse(parsejson["updatedISO"]),
      updateduk: parsejson["updateduk"]
    );
  }
}