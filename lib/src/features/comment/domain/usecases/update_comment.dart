import 'package:final_task/src/features/comment/data/models/models.dart';
import 'package:final_task/src/features/comment/domain/repositories/repositories.dart';

class UpdateComment {
  final CommentRepository cr;
  const UpdateComment({required this.cr});

  void call(CommentModel comment){
    cr.updateComment(comment);
  }
}