import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  void initState() {

    getPosts3();

  }

  List? data;

  void getPosts3() async {

    var apiUrl = Uri.parse('https://script.googleusercontent.com/macros/echo?user_content_key=WJKLLvpGxxPMcpDJJCzI1zDeG-_jLzAzfOk06vcPEL54IrO2gZJXiiT4f6sGOvLzQLFMfRQgWEHZIIXolnlSARpr7_4D4DBVOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHa1GhPSVukpSQTydEwAEXFXgt_wltjJcH3XHUaaPC1fv5o9XyvOto09QuWI89K6KjOu0SP2F-BdwUzo6zSRU-bMb_ggSB0IL0yNDTr4d6qr7jSv0kGHlpqfaUl1F-oz6HW4sNKtRc09Xgvl7IGsXAM8lUdx0plUaXVQ&lib=MnrE7b2I2PjfH799VodkCPiQjIVyBAxva');

    var apiUrl2 = Uri.parse('https://script.googleusercontent.com/macros/echo?user_content_key=2F9IxDnK2HZag3RpJOMeSW8WpAibAPbS-TfX3RpRZJEcTuj2ZukjfzjwjOEP1199T1VfPqVXBJWs52qPtDfjJgHBG5Z0EXovOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHa1GhPSVukpSQTydEwAEXFXgt_wltjJcH3XHUaaPC1fv5o9XyvOto09QuWI89K6KjOu0SP2F-BdwUh7dajWPvZd-bmx2H_66tfTwtNP8DvCKitafJxwa464MRkfpDutQTocCJ59mz8_6tvl7IGsXAM8lUdx0plUaXVQ&lib=MnrE7b2I2PjfH799VodkCPiQjIVyBAxva');
    const String url = "https://script.googleusercontent.com/macros/echo?user_content_key=WJKLLvpGxxPMcpDJJCzI1zDeG-_jLzAzfOk06vcPEL54IrO2gZJXiiT4f6sGOvLzQLFMfRQgWEHZIIXolnlSARpr7_4D4DBVOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHa1GhPSVukpSQTydEwAEXFXgt_wltjJcH3XHUaaPC1fv5o9XyvOto09QuWI89K6KjOu0SP2F-BdwUzo6zSRU-bMb_ggSB0IL0yNDTr4d6qr7jSv0kGHlpqfaUl1F-oz6HW4sNKtRc09Xgvl7IGsXAM8lUdx0plUaXVQ&lib=MnrE7b2I2PjfH799VodkCPiQjIVyBAxva";

    var response = await http.get(apiUrl2,
        headers: {"Accept":"application/json"}
    );


    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);

      data = convertDataToJson['products'];

    });





  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              //itemCount: snapshot.data?.length,
              itemCount: data ==null? 0 : data!.length,
              itemBuilder: (context, index) {

                if(data!.isEmpty){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return MyCardList(id: "${data?[index]['title']}",
                      title:" ${data?[index]['sub_text']}");
                }



              }


          ),

        ),

      ),
    );
  }
}

class MyCardList extends StatefulWidget {

  final String id;
  final String title;


  //final Function function;

  MyCardList({
    required this.id,
    required this.title,

  });


  //const MyCardList({Key? key}) : super(key: key);

  @override
  _MyCardListState createState() => _MyCardListState();
}

class _MyCardListState extends State<MyCardList> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(20),
      
      child: Column(
        
        
        
        children:  [

          Text(widget.id ,style: const TextStyle(fontWeight: FontWeight.bold),),
          Text(widget.title),
          const SizedBox(
            height: 20,
          )

        ],

      ),

    );
  }
}

