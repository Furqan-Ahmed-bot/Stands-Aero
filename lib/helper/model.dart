class UserModel {
  int? id;
  String? fullName;
  String? phone;
  String? email;
  String? propic;
  String? city;
  String? country;
  String? desc;

  UserModel(
      {this.id,
      this.fullName,
      this.phone,
      this.email,
      this.propic,
      this.city,
      this.country,
      this.desc});
}

class productModel {
  int? id;
  String? name;
  String? sku;
  int? leaseRate;
  String? thumbnail;
  String? location;
  String? desc;
  String? createdAt;
  String? updatedAt;
  productModel({
    this.id,
    this.name,
    this.sku,
    this.leaseRate,
    this.thumbnail,
    this.location,
    this.desc,
    this.createdAt,
    this.updatedAt,
  });
  
}
