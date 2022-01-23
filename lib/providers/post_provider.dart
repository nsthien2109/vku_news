import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/models/post.dart';

class PostProvider extends ChangeNotifier{
  List<PostModel>  _postList = [];
  List<PostModel> get postList{
    return _postList;
  }

  Future<PostModel?> fetchPostWithCategory(int categoryID) async{
    var url = Network().Server() +"/category/$categoryID";
    try{
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return null;
      }
      final List<PostModel> loadedPost = [];
      extractedData.forEach((value) {
        loadedPost.add(
            PostModel(
                idCategory: value['id_category'],
                idPost: value['id_post'],
                authorPost: value['author_post'],
                imagePost: value['image_post'],
                subPost: value['sub_post'],
                titlePost: value['title_post'],
                descriptionPost: value['description_post'],
                createdAt: value['created_at'],
                updatedAt: value['updated_at']
            )
        );
      });
      _postList = loadedPost;
      notifyListeners();
    }catch(error){
      rethrow;
    }
  }
}