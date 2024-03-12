class PostModel {
  String? name;
  String? img;
  String? uID;
  String? dateTime;
  String? text;
  String? postImage;

  PostModel(
      {this.name,
      this.img,
      this.uID,
      this.dateTime,
      this.postImage,
      this.text});
  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    uID = json['uID'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'img': img,
      'uID': uID,
      'postImage': postImage,
      'text': text,
      'dateTime': dateTime,
    };
  }
}
