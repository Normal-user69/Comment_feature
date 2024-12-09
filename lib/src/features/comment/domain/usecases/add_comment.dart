import 'package:final_task/src/features/comment/data/models/models.dart';
import 'package:final_task/src/features/comment/domain/repositories/repositories.dart';

class AddComment {
  final CommentRepository cr;
  const AddComment({required this.cr});

  void call(CommentModel comment){
    cr.addComment(comment);
  }
}