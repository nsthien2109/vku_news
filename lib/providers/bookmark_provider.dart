import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/models/bookmark.dart';
import 'package:vku_news/models/post.dart';
import 'package:http/http.dart' as http;

class BookmarkProvider extends ChangeNotifier{
  final BookmarkModel _postBookmark = BookmarkModel();
  BookmarkModel get postBookmark {
    return _postBookmark;
  }

  List<PostModel> _listBookmark = [];
  List<PostModel> get listBookmark {
    return _listBookmark;
  }

  Future<PostModel?> fetchBookmarkList(int idCustomer) async{
    var url = Network().Server()  + "/favorite/$idCustomer";
    try{
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return null;
      }
      final List<PostModel> loadedListBookmark = [];
      extractedData.forEach((value) {
        loadedListBookmark.add(
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
      _listBookmark = loadedListBookmark;
      notifyListeners();
    }catch (error){
      print("KHONG THE THUC HIEN FETCH BOOKMARK VI : $error");
      rethrow;
    }
  }

  Future<BookmarkModel?> addBookmark(int idPost, int idCustomer) async{
    var url = Network().Server()  + "/favorite";
    var data = {'id_post':idPost,'id_customer' : idCustomer,'status' : 1};
    try{
      final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data)
      );
      if(response.statusCode == 201){
        fetchBookmarkList(idCustomer);
        return BookmarkModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to add bookmark.');
      }
    }catch (error){
      print("KHONG THE ADD BOOKMARK VI : $error");
      rethrow;
    }
  }

  Future<BookmarkModel?> removeBookmark(int idBookmark) async{
    var url = Network().Server() + "/favorite/$idBookmark";
    print("Đang cần xóa : " + idBookmark.toString());
    try{
      final response = await http.delete(Uri.parse(url),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if(response.statusCode == 200){
        _listBookmark.removeWhere((element) => element.idPost == idBookmark);
        notifyListeners();
      }else{
        print("Khong dc roi");
      }
    }catch(error){
      print("Không xóa được ra khỏi list vì : ---- > $error");
      rethrow;
    }

  }

  bool checkBookmarkItem(int idPost) {
    print("LENG : "  + _listBookmark.length.toString());
    for (var i = 0; i < _listBookmark.length; i++) {
      if(_listBookmark[i].idPost == idPost){
        print("Yêu thích");
        return true;
      }
    }
    print ("Không yêu thích");
    return false;
  }

}