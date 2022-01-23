class CommentModel {
  int? idComment;
  int? idUser;
  int? idPost;
  String? username;
  String? avatarLink;
  String? commentContent;
  String? createdAt;
  String? updatedAt;

  CommentModel(
      {this.idComment,
        this.idUser,
        this.idPost,
        this.username,
        this.avatarLink,
        this.commentContent,
        this.createdAt,
        this.updatedAt});

  CommentModel.fromJson(Map<String, dynamic> json) {
    idComment = json['id_comment'];
    idUser = json['id_user'];
    idPost = json['id_post'];
    username = json['username'];
    avatarLink = json['avatar_link'];
    commentContent = json['comment_content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_comment'] = this.idComment;
    data['id_user'] = this.idUser;
    data['id_post'] = this.idPost;
    data['username'] = this.username;
    data['avatar_link'] = this.avatarLink;
    data['comment_content'] = this.commentContent;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}