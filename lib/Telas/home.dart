import 'package:flutter/material.dart';

import 'menu.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _abrirMenu(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> Menu()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("imagens/fundo4.png"),
              fit: BoxFit.cover
            )
          ),
          padding: EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Image.asset(
                        "imagens/logo1.png",
                        width: 300,
                        height: 200,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top:60,bottom: 10),
                      child : RaisedButton(
                        child: Text(
                          "Seja Bem-Vindo",
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                        color: Color(0xB1FADD43),
                        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        onPressed: (){
                          _abrirMenu();
                        },
                      )
                  )
                ],
              )
            ),
          ),
        )
    );
  }
}