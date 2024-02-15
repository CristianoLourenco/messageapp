class UserModel {
  final String? id;
  final String name;
  final String phoneNumber;
  final String passWord;
  final String? photoUrl;
  final String placeHolder;

  UserModel({
    this.id,
    this.name = '',
    this.phoneNumber = '',
    this.photoUrl,
    this.placeHolder = '',
    this.passWord = '',
  });

  factory UserModel.fromJson(String id, dynamic json) {
    final model = UserModel(
      id: id,
      name: json['name'] ?? '',
      phoneNumber: json['phone'] ?? '',
      photoUrl: json['image'],
      placeHolder: 'assets/images/loading_photo.png',
      passWord: json['password'] ?? '',
    );

    return model;
  }

  Map<String, dynamic> toJson() {
    final json = {
      // 'id': id,
      'name': name,
      'image': photoUrl,
      'password': passWord,
      'phone': phoneNumber,
    };
    return json;
  }
}
