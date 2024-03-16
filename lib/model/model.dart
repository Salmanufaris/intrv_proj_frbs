class Model {
  String? name;
  String? subName;
  String? price;

  Model({this.name, this.subName, this.price});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        name: json['name'] as String?,
        subName: json['subName'] as String?,
        price: json['price'] as String?);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subName': subName,
      'price': price,
    };
  }
}
