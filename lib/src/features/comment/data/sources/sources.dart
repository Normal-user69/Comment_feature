
import 'dart:convert';

import 'package:final_task/src/core/error/error.dart';
import 'package:final_task/src/features/comment/data/models/models.dart';
import 'package:http/http.dart' as http;

class CommentRemoteData {
  static List<CommentModel> comments = [];

  void addComment(CommentModel comment) {
    comments.add(comment);
  }

  void deleteComment(int id) {
    comments.removeWhere((com) => com.id == id);
  }

  Future<List<CommentModel>> getAllPostComments(int postId) async {
    final url = Uri.parse('https://dummyjson.com/posts/$postId/comments');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the response is successful, parse the JSON
      final List<dynamic> jsonData = json.decode(response.body)['comments'];
      comments = jsonData.map((json) => CommentModel.fromJson(json)).toList();
      return comments;
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      // Handle 4xx client errors
      throw ServerException();
    } else if (response.statusCode >= 500 && response.statusCode < 600) {
      // Handle 5xx server errors
      throw EmptyException();
    } else {
      throw OfflineException();
    }
  }

  void updateComment(CommentModel comment) {
    comments.map((e) => e.id == comment.id ? comment : e);
  }
}
