import 'package:conversor_moeda/models/result.dart';
import 'package:conversor_moeda/services/money_service.dart';
import 'package:conversor_moeda/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class MoedaPage extends StatefulWidget {
  @override
  _MoedaPageState createState() => _MoedaPageState();
}

class _MoedaPageState extends State<MoedaPage> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Conversor de Moedas",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.cloud_download,
              color: Colors.white,
            ),
            tooltip: "Consultar Cotação",
            onPressed: () {
              _clearFields();
              setState(() {});
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: MoneyService.getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Center(child: Text("Erro ao consultar as cotações"));
              } else {
                Result result = snapshot.data;
                dolar = result.currencies.usd.sell;
                euro = result.currencies.eur.sell;

                return SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.monetization_on,
                          size: 120, color: Colors.amber),
                      AppTextField(
                        "Real",
                        prefix: "R\$",
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        controller: realController,
                        onChanged: _changeReal,
                      ),
                      SizedBox(height: 10),
                      AppTextField(
                        "Dólar",
                        prefix: "\$",
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        controller: dolarController,
                        onChanged: _changeDolar,
                      ),
                      SizedBox(height: 10),
                      AppTextField(
                        "Euro",
                        prefix: "€",
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        controller: euroController,
                        onChanged: _changeEuro,
                      )
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }

  _clearFields() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  _changeReal(String value) {
    if (value.isEmpty) {
      dolarController.text = "";
      euroController.text = "";
    }
    double real = double.parse(value);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  _changeDolar(value) {
    if (value.isEmpty) {
      realController.text = "";
      euroController.text = "";
    }
    double dolar = double.parse(value);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  _changeEuro(value) {
    if (value.isEmpty) {
      realController.text = "";
      dolarController.text = "";
    }
    double euro = double.parse(value);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }
}
