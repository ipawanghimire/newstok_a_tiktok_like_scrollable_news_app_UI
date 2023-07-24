import 'package:flutter/material.dart';
import 'package:newstok/constants/appcolor.dart';
import 'package:newstok/screen/widget/common/retext.dart';

class IconPannel extends StatefulWidget {
  const IconPannel({super.key});

  @override
  State<IconPannel> createState() => _IconPannelState();
}

class _IconPannelState extends State<IconPannel> {
  int likes = 0;
  int dislikes = 0;
  int comments = 0;
  bool isLiked = false;
  bool isDisliked = false;

  // List to store comments
  List<String> commentList = [];

  // Text controller for the comment input field
  TextEditingController commentController = TextEditingController();

  void likePost() {
    setState(() {
      if (!isLiked && !isDisliked) {
        likes++;
        isLiked = true;
      } else if (isLiked) {
        likes--;
        isLiked = false;
      } else {
        likes++;
        dislikes--;
        isLiked = true;
        isDisliked = false;
      }
    });
  }

  void dislikePost() {
    setState(() {
      if (!isLiked && !isDisliked) {
        dislikes++;
        isDisliked = true;
      } else if (isDisliked) {
        dislikes--;
        isDisliked = false;
      } else {
        dislikes++;
        likes--;
        isDisliked = true;
        isLiked = false;
      }
    });
  }

  void postComment() {
    // Get the comment text from the input field
    String comment = commentController.text.trim();

    // Check if the comment is not empty
    if (comment.isNotEmpty) {
      setState(() {
        commentList.insert(0,
            comment); // Add the comment to the list (insert at the beginning)
        comments++; // Increase the comment counter
      });

      // Clear the input field after posting the comment
      commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.grey.withOpacity(0.3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton.icon(
            onPressed: likePost,
            icon: Icon(
              Icons.thumb_up,
              color: isLiked ? AppColors.green : AppColors.white,
            ),
            label: ReText(
              text: likes.toString(),
              textcolor: isLiked ? AppColors.green : AppColors.white,
            ),
          ),
          TextButton.icon(
            onPressed: dislikePost,
            icon: Icon(
              Icons.thumb_down,
              color: isDisliked ? AppColors.red : AppColors.white,
            ),
            label: ReText(
              text: dislikes.toString(),
              textcolor: isDisliked ? AppColors.red : AppColors.white,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      // Use ListView.builder with reverse set to true to display comments from bottom to top
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: commentList.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(commentList[index]),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: commentController,
                          decoration: InputDecoration(
                            hintText: 'Write a comment...',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: postComment,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.comment,
              color: AppColors.grey,
            ),
            label: ReText(
              text: comments.toString(),
              textcolor: AppColors.grey,
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: AppColors.white,
            ),
            label: ReText(text: '0', textcolor: AppColors.grey),
          )
        ],
      ),
    );
  }
}
