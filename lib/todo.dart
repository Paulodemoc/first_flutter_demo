import 'package:flutter/material.dart';

class MyTodoWidget extends StatefulWidget {
  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<MyTodoWidget> {

  List list = List();
  String input = "";

  @override
  void initState() {
    super.initState();
    list.add("nr.1");
    list.add("nr.2");
    list.add("nr.3");
    list.add("nr.4");
  }

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
                    //Navigator.pushNamed(context, '/screen2');
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
          showDialog(
              context: context,
            builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Add Todo"),
                  content: TextField (
                    onChanged: (String value){
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Add"),
                      onPressed: (){
                        setState(() {
                          list.add(input);
                          input = "";
                        });
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
            }
          );
        },
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
            key: Key(list[index]),
            child: ListTile(
              title: Text(list[index])
            ),
            onDismissed: (direction){
              setState(() {
                list.removeAt(index);
              });
            },
          );
        },
      )
    );
  }
}