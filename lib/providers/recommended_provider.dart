import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/models/post.dart';

class ReProvider extends ChangeNotifier{
  List<PostModel> _rePost = [];
  List<PostModel> get rePost{
    return _rePost;
  }

  List<PostModel> _listTemp = [];
  List<PostModel> get listTemp {
    return _listTemp;
  }

  Future<PostModel?> fetchRePost() async{
    var url = Network().Server() + "/latest-new";
    try{
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return null;
      }
      final List<PostModel> loadedRePost = [];
      extractedData.forEach((value) {
        loadedRePost.add(
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
      _rePost = loadedRePost;
      _listTemp = loadedRePost;
      notifyListeners();
    }catch (error){
      print(error);
      rethrow;
    }
  }

  Future<PostModel?> findCategory(List<PostModel> post, int categoryID) async {
    List<PostModel> loadedRePost = [];
    for (var i = 0; i < post.length; i++) {
      if(categoryID == 9999){
        _rePost = _listTemp;
        notifyListeners();
      }else if(post[i].idCategory == 2){
        loadedRePost.add(PostModel(
            idPost: post[i].idPost,
            idCategory: post[i].idCategory,
            authorPost: post[i].authorPost,
            imagePost: post[i].imagePost,
            subPost: post[i].subPost,
            titlePost: post[i].titlePost,
            descriptionPost: post[i].descriptionPost,
            createdAt: post[i].createdAt,
            updatedAt: post[i].updatedAt
        ));
        _rePost = loadedRePost;
        notifyListeners();
      }else if (post[i].idCategory == categoryID) {
        loadedRePost.add(PostModel(
          idPost: post[i].idPost,
          idCategory: post[i].idCategory,
          authorPost: post[i].authorPost,
          imagePost: post[i].imagePost,
          subPost: post[i].subPost,
          titlePost: post[i].titlePost,
          descriptionPost: post[i].descriptionPost,
          createdAt: post[i].createdAt,
          updatedAt: post[i].updatedAt
        ));
        _rePost = loadedRePost;
        notifyListeners();
      }
    }
  }

  void searchPost(String keyword){
    List<PostModel> loadedRePost = [];
    Iterable<PostModel> result = _listTemp.where((element){
      return element.descriptionPost!.contains(keyword);
    });
    result.forEach((element) {
      loadedRePost.add(element);
    });
    _rePost = loadedRePost;
    notifyListeners();
  }


  Future<PostModel?> fetchPostByCategory(int idCategory) async{
    var url = Network().Server() +"/category/$idCategory";
    try{
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return null;
      }
      final List<PostModel> loadedRePost = [];
      extractedData.forEach((value) {
        loadedRePost.add(
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
      _rePost = loadedRePost;
      notifyListeners();
    }catch (error){
      print(error);
      rethrow;
    }
  }

}