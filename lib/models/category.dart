class CategoryModel {
  int? idCategory;
  String? nameCategory;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.idCategory, this.nameCategory, this.createdAt, this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    idCategory = json['id_category'];
    nameCategory = json['name_category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_category'] = this.idCategory;
    data['name_category'] = this.nameCategory;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}