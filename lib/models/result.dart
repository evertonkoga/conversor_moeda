import 'package:conversor_moeda/models/currencie.dart';

class Result {
  Currencie currencies;

  Result(this.currencies);

  Result.fromJson(Map<String, dynamic> json) {
    currencies = json['currencies'] != null
        ? new Currencie.fromJson(json['currencies'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currencies != null) {
      data['currencies'] = this.currencies.toJson();
    }
    return data;
  }
}