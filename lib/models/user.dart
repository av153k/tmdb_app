class User {
  int? id;
  String? name;
  String? email;
  String? phone;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
