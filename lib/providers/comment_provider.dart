import 'package:flutter/cupertino.dart';
import 'package:vku_news/contants/network.dart';
import 'package:vku_news/models/comment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentProvider extends ChangeNotifier{
  List<CommentModel> _comment = [];
  List<CommentModel> get comment{
    return _comment;
  }

  Future<CommentModel?> fetchComment(int idPost) async{
    var url = Network().Server() + "/comment/$idPost";
    try{
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return null;
      }
      final List<CommentModel> loadedComment = [];
      extractedData.forEach((value){
        loadedComment.add(
          CommentModel(
            idComment: value['id_comment'],
            idUser: value['id_user'],
            idPost: value['id_post'],
            username: value['username'],
            avatarLink: value['avatar_link'],
            commentContent: value['comment_content'],
            createdAt: value['created_at'],
            updatedAt: value['updated_at']
          )
        );
      });
      _comment = loadedComment;
      notifyListeners();
    }catch(error){
      print("Error in comment provider : $error");
      rethrow;
    }
  }

  Future<CommentModel?> writeComment(int idUser, int idPost, String comment,String avatar,String name) async {
    var url = Network().Server() + "/comment";
    var data = {'id_post' : idPost,'id_user':idUser,'username' : name, 'avatar_link':avatar,'comment_content':comment};
    try{
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data)
      );
      if (response.statusCode == 201) {
        _comment.add(CommentModel.fromJson(jsonDecode(response.body)));
        return CommentModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to comment.');
      }

    }catch(error){
     print("Bình luận bị lỗi vì : $error");
     rethrow;
    }
  }
}