import 'package:conversor_moeda/models/money.dart';

class Currencie {
  String source;
  Mony usd;
  Mony eur;
  Mony gbp;
  Mony ars;
  Mony btc;

  Currencie({this.source, this.usd, this.eur, this.gbp, this.ars, this.btc});

  Currencie.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    usd = json['USD'] != null ? Mony.fromJson(json['USD']) : null;
    eur = json['EUR'] != null ? Mony.fromJson(json['EUR']) : null;
    gbp = json['GBP'] != null ? Mony.fromJson(json['GBP']) : null;
    ars = json['ARS'] != null ? Mony.fromJson(json['ARS']) : null;
    btc = json['BTC'] != null ? Mony.fromJson(json['BTC']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    if (this.usd != null) {
      data['USD'] = this.usd.toJson();
    }
    if (this.eur != null) {
      data['EUR'] = this.eur.toJson();
    }
    if (this.gbp != null) {
      data['GBP'] = this.gbp.toJson();
    }
    if (this.ars != null) {
      data['ARS'] = this.ars.toJson();
    }
    if (this.btc != null) {
      data['BTC'] = this.btc.toJson();
    }
    return data;
  }
}