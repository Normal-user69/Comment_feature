class Comment {
  int? id;
  String? body;
  int? postId;
  int? likes;
  User? user;

  Comment({this.id, this.body, this.postId, this.likes, this.user});


}

class User {
  int? id;
  String? username;
  String? fullName;

  User({this.id, this.username, this.fullName});

}
