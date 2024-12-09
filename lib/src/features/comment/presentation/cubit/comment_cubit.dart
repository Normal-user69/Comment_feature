import 'package:final_task/src/features/comment/data/models/models.dart';
import 'package:final_task/src/features/comment/data/sources/sources.dart';
import 'package:final_task/src/features/comment/presentation/cubit/comment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit
class CommentCubit extends Cubit<CommentState> {
  final CommentRemoteData remoteData;

  CommentCubit(this.remoteData) : super(CommentInitial());

  Future<void> addComment(CommentModel comment) async {
    emit(CommentAdding());
    try {
      remoteData.addComment(comment);
      emit(CommentAdded(comment));
    } catch (e) {
      emit(CommentInitial());
    }
  }

  Future<void> removeComment(int commentId) async {
    emit(CommentRemoving());
    try {
      remoteData.deleteComment(commentId);
      emit(CommentRemoved(commentId));
    } catch (e) {
      emit(CommentInitial());
    }
  }

  Future<void> editComment(CommentModel comment) async {
    emit(CommentEditing());
    try {
      remoteData.updateComment(comment);
      emit(CommentEdited(comment));
    } catch (e) {
      emit(CommentInitial());
    }
  }

  void toggleLike(int commentId, bool isLiked) {
    try {
      emit(CommentLikeToggled(commentId, isLiked));
    } catch (e) {
      emit(CommentInitial());
    }
  }
}

class LikeButtonCubit extends Cubit<bool> {
  LikeButtonCubit() : super(false); // Initial state is unliked (black)

  void toggleLike() {
    emit(!state); // Toggle the current state
  }
}
