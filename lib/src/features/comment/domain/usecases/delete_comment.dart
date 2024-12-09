import 'package:final_task/src/features/comment/domain/repositories/repositories.dart';

class DeleteComment {
  final CommentRepository cr;
  const DeleteComment({required this.cr});

  void call(int id){
    cr.deleteComment(id);
  }
}