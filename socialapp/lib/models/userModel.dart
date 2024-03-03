class userModel {
  String? name;
  String? email;
  String? phone;
  String? img;
  String? uID;
  String? bio;

  bool? isEmailVerivied;
  userModel({
    this.email,
    this.name,
    this.phone,
    this.img,
    this.uID,
    this.bio,
    this.isEmailVerivied,
  });
  userModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    img = json['img'];
    bio = json['bio'];

    phone = json['phone'];
    isEmailVerivied = json['isEmailVerivied'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'img': img,
      'email': email,
      'phone': phone,
      'uID': uID,
      'bio': bio,
      'isEmailVerivied': isEmailVerivied,
    };
  }
}
