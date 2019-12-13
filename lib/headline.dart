import 'package:flutter/material.dart';



class HeadlineModel extends StatelessWidget {


  final String headlineNews;

  const HeadlineModel({Key key,

    @required this.headlineNews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {



    Padding(
      padding: const EdgeInsets.all(12.0),

      child: Text(headlineNews,style: TextStyle(
        fontSize: 15.0,
      ),
      ),

    );

  }
}
