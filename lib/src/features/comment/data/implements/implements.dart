import 'package:either_dart/either.dart';
import 'package:final_task/src/core/error/error.dart';
import 'package:final_task/src/features/comment/data/models/models.dart';
import 'package:final_task/src/features/comment/data/sources/sources.dart';
import '../../domain/repositories/repositories.dart';

class CommentRepostoryImp extends CommentRepository {
  CommentRemoteData crd = CommentRemoteData();
  @override
  void addComment(CommentModel comment) {
    crd.addComment(comment);
  }

  @override
  void deleteComment(int id) {
    crd.deleteComment(id);
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getAllPostComments(int postid) async {
    try {
      // Attempt to fetch comments from the remote data source
      return Right(await crd.getAllPostComments(postid));
    } on ServerException {
      return Left(ServerFaliure());
    } on OfflineException {
      return Left(OfflineFaliure());
    } on EmptyFaliure {
      return Left(EmptyFaliure());
    }
  }

  @override
  void updateComment(CommentModel comment) {
    crd.updateComment(comment);
  }
}
