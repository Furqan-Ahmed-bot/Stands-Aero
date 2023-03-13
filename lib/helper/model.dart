class UserModel {
  int? id;
  int? isKycFilled;
  int? isCreditFormFilled;
  String? fullName;
  String? phone;
  String? email;
  String? propic;
  String? city;
  String? country;
  String? description;

  UserModel(
      {this.id,
      this.fullName,
      this.phone,
      this.email,
      this.propic,
      this.city,
      this.country,
      this.isKycFilled,
      this.isCreditFormFilled,
      this.description});
}

class productModel {
  int? id;
  String? name;
  String? sku;
  int? leaseRate;
  String? thumbnail;
  String? location;
  String? description;
  String? createdAt;
  String? updatedAt;
  productModel({
    this.id,
    this.name,
    this.sku,
    this.leaseRate,
    this.thumbnail,
    this.location,
    this.description,
    this.createdAt,
    this.updatedAt,
  });
}

class quoteModel {
  int? id;
  String? name;
  String? location;
  String? details;
  quoteModel({
    this.id,
    this.name,
    this.location,
    this.details,
  });
}
