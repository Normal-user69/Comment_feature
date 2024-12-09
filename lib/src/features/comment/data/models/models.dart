import 'package:final_task/src/features/comment/domain/entities/entities.dart';

class CommentModel extends Comment {
  CommentModel({
    required super.id,
    required super.body,
    required super.postId,
    required super.likes,
    super.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] ,
      body: json['body'],
      postId: json['postId'],
      likes: json['likes'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    data['postId'] = postId;
    data['likes'] = likes;
    if (user != null) {
      data['user'] = (user as UserModel).toJson();
    }
    return data;
  }
}

class UserModel extends User {
  UserModel({
    required super.id,
    required super.username,
    required super.fullName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['fullName'] = fullName;
    return data;
  }
}
