import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app111/assign.dart';
import 'package:flutter_app111/headline_model.dart';
import 'package:http/http.dart' as http;



class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final  String newsUrl="https://newsapi.org/v2/everything?q=bitcoin&apiKey=f394ff5ccf2440a5bc0c35c8713c8a18";
  List newsData;
  bool isNewsLoaded= false;


  @override
  void initState() {

    super.initState();
    this.getNewsData();
  }
  Future<String>getNewsData() async{

    var response= await http.get(
      Uri.encodeFull(newsUrl),
      headers:{'Accept':'application / json'
      }
    );
    setState(() {
      var convertDataToJson = json.decode(response.body);
      newsData= convertDataToJson['articles'];
      isNewsLoaded= true;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isNewsLoaded?ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: newsData == null?0:newsData.length,
        itemBuilder: (_,int index){
          return GestureDetector(
            onTap:(){
              Navigator.of(context).push(
                MaterialPageRoute(builder:(_)=>assignment(
                  headLineAuthor: newsData[index]['author'],
                  headLineDescription: newsData[index]['description'] ,
                  headLinePoster: newsData[index]['urlToImage'] ,
                ))
              );
            },
            child: HeadlineModel(

                headlineNews: newsData[index]['title'],

            ),
          );
        },
      ):Center(
        child:CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}



