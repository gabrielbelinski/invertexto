import 'package:flutter/material.dart';
import 'package:invertexto/service/invertexto_service.dart';

class PorExtensoPage extends StatefulWidget {
  const PorExtensoPage({super.key});

  @override
  State<PorExtensoPage> createState() => _PorExtensoPageState();
}

class _PorExtensoPageState extends State<PorExtensoPage> {
  String? campo;
  String? resultado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/imgs/logo.png',
                fit: BoxFit.contain,
                height: 40,
              ),
            ],
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Digite um número inteiro",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 18),
                onSubmitted: (value) {
                  setState(() {
                    campo = value;
                  });
                },
              ),
              Expanded(child: FutureBuilder(future: converteNumeroPorExtenso(campo), builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if(snapshot.hasError){
                        return Container();
                    }
                    else{
                      return exibeResultado(context, snapshot);
                      //return Container();
                    }
                }
              }))
            ],
          ),
        ));
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: snapshot.data['text'],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
      ),
    );
  }
}
