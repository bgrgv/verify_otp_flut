import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Generator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Key Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime currTime = DateTime.now();
  var value;
  int i=0,x=0;
  int out = 0;
  var out2="";
  int minute,len,sum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Enter Your Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,),textAlign: TextAlign.center,)
              ],
            ),
            Divider(height: 70.0,),
            Padding(
              padding: const EdgeInsets.only(left: 35,right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        new TextField(
                          decoration:
                              InputDecoration(hintText: "Enter Owner's Name",alignLabelWithHint: true),
                              obscureText: true,
                              onChanged: (text){
                                value=text;
                              },
                        ),
                        Divider(height: 30.0,),
                        Text("Key : ",style: TextStyle(fontSize: 30.0,),textAlign: TextAlign.center,),
                        Divider(height: 20.0,),
                        Text(out.toString(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          currTime = DateTime.now(),
          x=0,
          for(i=0;i<value.length;i++){
            x=x+(value.codeUnitAt(i)),
          },
          print(x),
          print(currTime.minute),
          print(value.length*currTime.minute*x),
          setState((){
            out=(value.length*currTime.minute*x);
          })
          },
        tooltip: 'Increment',
        backgroundColor: Colors.red,
        child: Icon(Icons.code),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
