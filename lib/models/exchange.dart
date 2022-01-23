class ExchangeModel {
  List<Items>? items;

  ExchangeModel({this.items});

  ExchangeModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? type;
  String? imageurl;
  String? muatienmat;
  String? muack;
  String? bantienmat;
  String? banck;

  Items(
      {this.type,
        this.imageurl,
        this.muatienmat,
        this.muack,
        this.bantienmat,
        this.banck});

  Items.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    imageurl = json['imageurl'];
    muatienmat = json['muatienmat'];
    muack = json['muack'];
    bantienmat = json['bantienmat'];
    banck = json['banck'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['imageurl'] = this.imageurl;
    data['muatienmat'] = this.muatienmat;
    data['muack'] = this.muack;
    data['bantienmat'] = this.bantienmat;
    data['banck'] = this.banck;
    return data;
  }
}