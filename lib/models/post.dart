class PostModel {
  int? idPost;
  String? titlePost;
  String? subPost;
  String? descriptionPost;
  String? imagePost;
  String? authorPost;
  int? idCategory;
  String? createdAt;
  String? updatedAt;

  PostModel(
      {this.idPost,
        this.titlePost,
        this.subPost,
        this.descriptionPost,
        this.imagePost,
        this.authorPost,
        this.idCategory,
        this.createdAt,
        this.updatedAt});

  PostModel.fromJson(Map<String, dynamic> json) {
    idPost = json['id_post'];
    titlePost = json['title_post'];
    subPost = json['sub_post'];
    descriptionPost = json['description_post'];
    imagePost = json['image_post'];
    authorPost = json['author_post'];
    idCategory = json['id_category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_post'] = this.idPost;
    data['title_post'] = this.titlePost;
    data['sub_post'] = this.subPost;
    data['description_post'] = this.descriptionPost;
    data['image_post'] = this.imagePost;
    data['author_post'] = this.authorPost;
    data['id_category'] = this.idCategory;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}