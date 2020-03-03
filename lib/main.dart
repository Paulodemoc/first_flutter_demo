import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'todo.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.orange,
        brightness: Brightness.dark
      ),
      routes: {
        '/todo': (context) => MyTodoWidget()
      },
    )
  );
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepPurple,
        child: Center(
            child: Text("Hello from Flutter", textDirection: TextDirection.ltr, style: TextStyle(fontSize: 32.0, color: Colors.orange),)
        )
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _StatefulWidgetState createState() => _StatefulWidgetState();
}

class _StatefulWidgetState extends State<MyStatefulWidget> {
  var checkInput = false;
  int gender = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter", textDirection: TextDirection.ltr,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.beenhere),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.map),
            onPressed: (){

            },
          )
        ],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image(
                  image: AssetImage("images/burningtree.jpg"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 16.0),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage("images/avatar.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 120.0, left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Paulo Neves", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white
                      )),
                      Text("paulodemoc@gmail.com", style: TextStyle(
                          color: Colors.white
                      ))
                    ],
                  )
                )
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Hello There"),
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) =>new MyTodoWidget()));
                    //Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "continue"
              ),
              onChanged: (input){
                print(input);
              },
            ),
            Checkbox(
              value: checkInput,
              onChanged: (bool value){
                setState(() {
                  checkInput = value;
                });
              },
            ),
            ButtonBar(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: gender,
                  onChanged: (int value){
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                Radio(
                  value: 2,
                  groupValue: gender,
                  onChanged: (int value){
                    setState(() {
                      gender = value;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}