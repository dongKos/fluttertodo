import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Firestore firestore = Firestore.instance;
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello world"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child: Text("create button", style: TextStyle(color : Colors.white)),
              onPressed: (){
                String book = "천년의_질문";
                firestore.collection('baby').document('stranger')
                    .setData({ 'name': 'stranger', 'votes': 30});
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("read button", style: TextStyle(color : Colors.white)),
              onPressed: (){
                String title = "";
                firestore.collection("baby").document("dongko").get()
                    .then((DocumentSnapshot ds){
                  title = ds.data["name"];
                  print(title);
                });
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("update button", style: TextStyle(color : Colors.white)),
              onPressed: (){
                //클릭시 데이터를 갱신해준다.
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("delete button", style: TextStyle(color : Colors.white)),
              onPressed: (){
                //클릭시 데이터를 삭제해 준다.
              },
            ),
          ],
        ),
      ),
    );
  }
}