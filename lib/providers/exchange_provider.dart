import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/models/exchange.dart';

class ExchangeProvider extends ChangeNotifier{
  ExchangeModel _exchange = ExchangeModel();
  ExchangeModel get exchange{
    return _exchange;
  }

  Future<ExchangeModel?> fetchExchange() async{
    var url = Network().Server() + "/exchange";
    try{
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return null;
      }
      _exchange = ExchangeModel.fromJson(extractedData);
      print(exchange.items![0].bantienmat);
      notifyListeners();
    }catch (error){
      print("Get Exchaneg Error in : $error");
      rethrow;
    }
  }
}