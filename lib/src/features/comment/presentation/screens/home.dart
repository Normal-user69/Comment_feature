import 'package:either_dart/either.dart';
import 'package:final_task/src/core/error/error.dart';
import 'package:final_task/src/core/widgets/bottom_bar.dart';
import 'package:final_task/src/core/widgets/custome_bar.dart';
import 'package:final_task/src/features/comment/data/implements/implements.dart';
import 'package:final_task/src/features/comment/data/models/models.dart';
import 'package:final_task/src/features/comment/presentation/cubit/comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeBar("Comments", true),
      bottomNavigationBar: bottomBar(context, 0),
      body: coms(),
    );
  }

  Widget coms() {
    final CommentRepostoryImp cri = CommentRepostoryImp();
    const int postId = 242;

    return FutureBuilder<Either<Failure, List<CommentModel>>>(
      future: cri.getAllPostComments(postId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          //! No Comments Failure Condition
          return Center(child: Text(EmptyFaliure().toString()));
        } else if (snapshot.hasData) {
          final result = snapshot.data!;
          return result.fold(
            //! Server Failure Condition
            (failure) => Center(child: Text(ServerFaliure().toString())),

            //! Comments Builder
            (comments) => ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                // Individual Comment
                final comment = comments[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    decoration: commentDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        profilePic(),
                        Expanded(
                          child: commentBody(comment),
                        ),
                        BlocProvider(
                          create: (context) => LikeButtonCubit(),
                          child: BlocBuilder<LikeButtonCubit, bool>(
                            builder: (context, isLiked) {
                              return IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: isLiked ? Colors.blue : Colors.black,
                                ),
                                onPressed: () {
                                  context.read<LikeButtonCubit>().toggleLike();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(child: Text("No data available."));
        }
      },
    );
  }

  Padding profilePic() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(
            "https://www.shutterstock.com/image-vector/default-placeholder-avatar-profile-on-260nw-490458535.jpg"),
      ),
    );
  }

  Widget commentBody(CommentModel comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.user!.username!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            comment.body!,
            style: const TextStyle(color: Colors.black),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  BoxDecoration commentDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.grey[200],
    );
  }
}
