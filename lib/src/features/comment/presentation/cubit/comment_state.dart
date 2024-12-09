import 'package:equatable/equatable.dart';
import 'package:final_task/src/features/comment/data/models/models.dart';

// States
abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentAdding extends CommentState {}

class CommentAdded extends CommentState {
  final CommentModel comment;

  const CommentAdded(this.comment);

  @override
  List<Object> get props => [comment];
}

class CommentRemoving extends CommentState {}

class CommentRemoved extends CommentState {
  final int commentId;

  const CommentRemoved(this.commentId);

  @override
  List<Object> get props => [commentId];
}

class CommentEditing extends CommentState {}

class CommentEdited extends CommentState {
  final CommentModel comment;

  const CommentEdited(this.comment);

  @override
  List<Object> get props => [comment];
}

class CommentLikeToggled extends CommentState {
  final int commentId;
  final bool isLiked;

  const CommentLikeToggled(this.commentId, this.isLiked);

  @override
  List<Object> get props => [commentId, isLiked];
}
