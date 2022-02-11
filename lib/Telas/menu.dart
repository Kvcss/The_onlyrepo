import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlyrepo/Telas/conteudo.dart';

//import './adddata.dart';



class Menu extends StatefulWidget {
  @override
  _MenuState createState() => new _MenuState();
}

class _MenuState extends State<Menu> {
  Future<List> getData() async {
    final response = await http.get("http://10.0.2.2/my_store/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("OnlyRepo", style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xB1FADD43),
      ),
      /*floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new AddData(),
            )
        ),
      ),
      */
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData? new ItemList(list: snapshot.data,
          )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(

          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context)=> Conteudo(list:list,index:i)
              )
            ),
            child: Card(
                child: ListTile(
                  title: Text(list[i]['name']),
                  leading: Icon(Icons.list),
                  subtitle: Text("Descrição: ${list[i]['description']}"),
                ),
            ),
          ),
        );/*Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new Detail(list:list , index: i,)
                )
            ),
            child: new Card(

              child: new ListTile(
                title: ne w Text(list[i]['item_name']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Stock : ${list[i]['stock']}"),
              ),
            ),
          ),
        );*/
      },
    );
  }
}