import 'package:flutter/material.dart';

class Conteudo extends StatefulWidget {
  List list;
  int index;
  Conteudo({this.index,this.list});
  @override
  _ConteudoState createState() => _ConteudoState();
}

class _ConteudoState extends State<Conteudo> {

  String _getCont(List aux, int i){
    String content = aux[i]['content'];
    int startIndex = 3;
    int endIndex = content.length-4;
    String result = content.substring(startIndex,endIndex);
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${widget.list[widget.index]['name']}", style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xB1FADD43)
      ),

      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child:  SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    widget.list[widget.index]['name'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child:  Text(_getCont(widget.list,widget.index),
                        style: TextStyle(fontSize: 18.0)

                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:30)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}