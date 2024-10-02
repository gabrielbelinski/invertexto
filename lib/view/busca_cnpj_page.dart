import 'package:flutter/material.dart';
import 'package:invertexto/service/invertexto_service.dart';

class BuscaCnpjPage extends StatefulWidget {
  const BuscaCnpjPage({super.key});

  @override
  State<BuscaCnpjPage> createState() => _BuscaCnpjPageState();
}

class _BuscaCnpjPageState extends State<BuscaCnpjPage> {
  String? numeroCnpj;

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
                  labelText: "Digite o CNPJ desejado, sem traços e pontos:",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 18),
                onSubmitted: (value) {
                  setState(() {
                    numeroCnpj = value;
                  });
                },
              ),
              Expanded(
                  child: FutureBuilder(
                      future: buscaCNPJ(numeroCnpj),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return Container(
                              width: 200.0,
                              height: 200.0,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 5.0,
                              ),
                            );
                          default:
                            if (snapshot.hasError) {
                              return Container();
                            } else {
                              return exibeCnpj(context, snapshot);
                              //return Container();
                            }
                        }
                      }))
            ],
          ),
        ));
  }

  Widget exibeCnpj(BuildContext context, AsyncSnapshot snapshot){
    return ListView(
      children: <Widget>[
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['cnpj'],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['razao_social'],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['nome_fantasia'],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['telefone1'],
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['situacao'] != null ? snapshot.data['situacao']['nome'] : '',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['endereco'] != null ? snapshot.data['endereco']['logradouro'] : '',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['endereco'] != null ? snapshot.data['endereco']['numero'] : '',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['endereco'] != null ? snapshot.data['endereco']['bairro'] : '',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['endereco'] != null ? snapshot.data['endereco']['cep'] : '',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['endereco'] != null ? snapshot.data['endereco']['uf'] : '',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['endereco'] != null ? snapshot.data['endereco']['municipio'] : '',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextField(
          readOnly: true,
          decoration: InputDecoration(
            labelText: snapshot.data['atividade_principal'] != null ? snapshot.data['atividade_principal']['descricao'] : '',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder()),
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
      ],
    );
  }
}
