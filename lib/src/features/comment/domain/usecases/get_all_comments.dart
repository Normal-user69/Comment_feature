import 'package:either_dart/either.dart';
import 'package:final_task/src/core/error/error.dart';
import 'package:final_task/src/features/comment/data/models/models.dart';
import 'package:final_task/src/features/comment/domain/repositories/repositories.dart';

class GetAllComments {
  final CommentRepository cr;
  const GetAllComments({required this.cr});

  Future<Either<Failure, List<CommentModel>>> call(int postid){
    return cr.getAllPostComments(postid);
  }
}