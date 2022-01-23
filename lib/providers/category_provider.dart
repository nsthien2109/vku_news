import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier{

  List<CategoryModel> _category = [];

  List<CategoryModel> get category{
    return _category;
  }

  Future<CategoryModel?> fetchCategory() async {
    var url = Network().Server() + "/category";
    try{
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return null;
      }
      final List<CategoryModel> loadedCategories = [];
      loadedCategories.add(
        CategoryModel(
          idCategory: 9999,
          nameCategory: "All",
          updatedAt: null,
          createdAt: null
        )
      );
      extractedData.forEach((value) {
        loadedCategories.add(
          CategoryModel(
            idCategory: value['id_category'],
            nameCategory: value['name_category'],
            createdAt: value['created_at'],
            updatedAt: value['updated_at']
          )
        );
      });
      _category = loadedCategories;
      notifyListeners();
    }catch (error){
      print(error.toString());
      rethrow;
    }
  }

}