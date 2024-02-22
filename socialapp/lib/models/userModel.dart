class userModel {
  String? name;
  String? email;
  String? phone;
  String? uID;
  bool? isEmailVerivied;
  userModel({
    this.email,
    this.name,
    this.phone,
    this.uID,
    this.isEmailVerivied,
  });
  userModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    isEmailVerivied = json['isEmailVerivied'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uID': uID,
      'isEmailVerivied': isEmailVerivied,
    };
  }
}
