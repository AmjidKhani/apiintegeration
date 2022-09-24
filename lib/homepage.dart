import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'manuallmethodemodel.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var timeshow;

  Future<BitCoinApiModel> Fetchdata() async {
    String uri = "https://api.coindesk.com/v1/bpi/currentprice.json";
    http.Response response = await http.get(Uri.parse(uri));
    Map<String, dynamic> jsontomap = await jsonDecode(response.body);
    BitCoinApiModel s = BitCoinApiModel.fromjson(jsontomap);
    return s;
  }

  @override
  void initState() {
    Fetchdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
        future: Fetchdata(),
        builder:
            (BuildContext context, AsyncSnapshot<BitCoinApiModel> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Container(
                height: 150,
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(3, 3),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text("${snapshot.data!.time!.updateduk}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    textAlign: TextAlign.center)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text("${snapshot.data!.time!.updated}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    textAlign: TextAlign.center)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                                    "${snapshot.data!.time!.updatedISO}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    textAlign: TextAlign.center)),
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(2, 3),
                      )
                    ]),
                child: Center(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data!.disclaimer!,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Todays ${snapshot.data!.chartName!}${" Rates "}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("EURO :",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 80,
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0,left: 10,),
                      child: Text("${snapshot.data!.bpii!.eru!.rate_float}",style: TextStyle(color: Colors.white),
                      ),
                    ),
                    constraints: BoxConstraints(maxHeight: 80,
                        maxWidth:  250
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),


                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: Offset(2, 3),
                          )
                        ]),
                  ),
                ],
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("GBP  :",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 80,
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0,left: 10),
                      child: Text("${snapshot.data!.bpii!.gbp!.rate_float}", textAlign:TextAlign.start,style: TextStyle(color: Colors.white)
                      ),
                    ),
                    constraints: BoxConstraints(maxHeight: 80,
                        maxWidth:  250
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10),


                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.brown,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: Offset(2, 3),
                          )
                        ]),
                  ),
                ],
              ),
            SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("USD  :",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 80,
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(top:30.0,left: 10),
                      child: Text("${snapshot.data!.bpii!.usd!.rate_float}",style: TextStyle(
                        color: Colors.white
                      ),
                          textAlign:TextAlign.start
                      ),
                    ),


                    constraints: BoxConstraints(maxHeight: 80,minHeight: 80,
                        minWidth: 80,
                        maxWidth: 250),
                    margin: EdgeInsets.symmetric(horizontal: 10),


                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: Offset(2, 3),
                          )
                        ]),
                  ),
                ],
              )
            ],
          );
        },
      )),
    );
  }
}
