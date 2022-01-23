import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/models/account.dart';
import 'package:http/http.dart' as http;

class AccountProvider extends ChangeNotifier {
  AccountModel _account = AccountModel();
  AccountModel get account {
    return _account;
  }

  int? checkLogin() {
    if (account.idCustomer == null) {
      return null;
    } else {
      return account.idCustomer;
    }
  }

  Future<AccountModel?> login(String email, String password) async {
    var url = Network().Server() + "/login_app";
    var data = {'email_customer': email, 'password_customer': password};
    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));

      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return null;
      }
      print(extractedData['data']['id_customer']);
      _account = AccountModel(
          idCustomer: extractedData['data']['id_customer'],
          nameCustomer: extractedData['data']['name_customer'],
          phoneCustomer: extractedData['data']['phone_customer'],
          emailCustomer: extractedData['data']['email_customer'],
          addressCustomer: extractedData['data']['address_customer'],
          avatarCustomer: extractedData['data']['avatar_customer'],
          passwordCustomer: extractedData['data']['password_customer']);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  void logout() {
    _account = AccountModel();
    print(account.idCustomer.toString() + " Da Logout");
    notifyListeners();
  }

  Future<AccountModel?> register(String name,String email,String password,String phone) async{
    var url = Network().Server() + "/customer";
    var data = {'name_customer':name,'email_customer':email,'password_customer':password,'phone_customer':phone};
    try{
      final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data)
      );
      if (response.statusCode == 201) {
        return AccountModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create user.');
      }
    }catch(error){
      print("Đăng kí lỗi vì : $error");
      rethrow;
    }
  }

  Future<AccountModel> changeProfile (int idCustomer , String name, String email, String phone, String password) async{
    var url = Network().Server() + "/customer/$idCustomer";
    try{
      print('$idCustomer -- $name -- $email -- $phone -- $password --');
      final response = await http.put(Uri.parse(url),
          headers: <String, String>{
            'Content-Type' : 'application/json; charset=UTF-8',
          },
        body: jsonEncode(<String,String>{
          'email_customer' : email,
          'phone_customer' : phone,
          'name_customer' : name,
          'password_customer' : password,
        })
      );
      if (response.statusCode == 200) {
        _account.passwordCustomer = password;
        _account.nameCustomer = name;
        _account.phoneCustomer = phone;
        notifyListeners();
        return AccountModel.fromJson(jsonDecode(response.body));
      } else {
        print(response.statusCode);
        print(response.body);
        throw Exception('Failed to update user.');
      }
    }catch (error){
      print("KHONG THE THAY DOI VI ❌ ❌ : $error");
      rethrow;
    }
  }
}
