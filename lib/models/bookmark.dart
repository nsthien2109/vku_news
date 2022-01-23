class BookmarkModel {
  int? idFavorite;
  int? idPost;
  int? idCustomer;
  int? status;
  String? createdAt;
  String? updatedAt;

  BookmarkModel(
      {this.idFavorite,
        this.idPost,
        this.idCustomer,
        this.status,
        this.createdAt,
        this.updatedAt});

  BookmarkModel.fromJson(Map<String, dynamic> json) {
    idFavorite = json['id_favorite'];
    idPost = json['id_post'];
    idCustomer = json['id_customer'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_favorite'] = this.idFavorite;
    data['id_post'] = this.idPost;
    data['id_customer'] = this.idCustomer;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}