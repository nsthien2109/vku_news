class AccountModel {

  int? idCustomer;
  String? nameCustomer;
  String? phoneCustomer;
  String? emailCustomer;
  String? birthCustomer;
  String? passwordCustomer;
  String? addressCustomer;
  String? avatarCustomer;
  String? createdAt;
  String? updatedAt;

  AccountModel(
      {this.idCustomer,
        this.nameCustomer,
        this.phoneCustomer,
        this.emailCustomer,
        this.birthCustomer,
        this.passwordCustomer,
        this.addressCustomer,
        this.avatarCustomer,
        this.createdAt,
        this.updatedAt});

  AccountModel.fromJson(Map<String, dynamic> json) {
    idCustomer = json['id_customer'];
    nameCustomer = json['name_customer'];
    phoneCustomer = json['phone_customer'];
    emailCustomer = json['email_customer'];
    birthCustomer = json['birth_customer'];
    passwordCustomer = json['password_customer'];
    addressCustomer = json['address_customer'];
    avatarCustomer = json['avatar_customer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_customer'] = this.idCustomer;
    data['name_customer'] = this.nameCustomer;
    data['phone_customer'] = this.phoneCustomer;
    data['email_customer'] = this.emailCustomer;
    data['birth_customer'] = this.birthCustomer;
    data['password_customer'] = this.passwordCustomer;
    data['address_customer'] = this.addressCustomer;
    data['avatar_customer'] = this.avatarCustomer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}