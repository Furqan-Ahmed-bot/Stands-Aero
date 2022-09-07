class UserController {
  User? user;

  UserController({this.user});

  UserController.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? phone;
  String? email;
  String? propic;
  String? city;
  String? country;
  String? desc;

  User(
      {this.id,
      this.fullName,
      this.phone,
      this.email,
      this.propic,
      this.city,
      this.country,
      this.desc});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phone = json['phone'];
    email = json['email'];
    propic = json['propic'];
    city = json['city'];
    country = json['country'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['propic'] = this.propic;
    data['city'] = this.city;
    data['country'] = this.country;
    data['desc'] = this.desc;
    return data;
  }
}
