class UserModel {
  final String? id;
  final String name;
  final String phoneNumber;
  final String? photoUrl;
  final String placeHolder;

  UserModel({
    this.id,
    this.name = "",
    this.phoneNumber = "",
    this.photoUrl,
    this.placeHolder = "",
  });

  factory UserModel.fromJson(dynamic json) {
    final model = UserModel(
        id: json['id'],
        name: json['name'] ?? "",
        phoneNumber: json['phone'] ?? "",
        photoUrl: json['image'],
        placeHolder: 'assets/images/loading_photo.png');
    return model;
  }

  void toJson() {}
}
