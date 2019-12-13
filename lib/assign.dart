import 'package:flutter/material.dart';

class assignment extends StatelessWidget {

  final String headLinePoster;
  final String headLineAuthor;
  final String headLineDescription;



  const assignment({Key key,
    @required this.headLinePoster,
    @required this.headLineAuthor,
    @required this.headLineDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
      Image.network(headLinePoster,fit: BoxFit.cover,

    ),
    Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(headLineAuthor,style: TextStyle(
    fontSize: 15.0,
    ),
    ),

    ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(headLineDescription,style: TextStyle(
            fontSize: 15.0,
          ),
          ),

        ),
    ],
    );
  }
}

