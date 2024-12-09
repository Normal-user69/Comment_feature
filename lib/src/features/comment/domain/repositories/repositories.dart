 
    import 'package:either_dart/either.dart';
import 'package:final_task/src/core/error/error.dart';
import 'package:final_task/src/features/comment/data/models/models.dart';

abstract class CommentRepository {
  void addComment(CommentModel comment);
  Future<Either<Failure, List<CommentModel>>> getAllPostComments(int postid);
  void deleteComment(int id);
  void updateComment(CommentModel comment);
        }
    