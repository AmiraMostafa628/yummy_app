import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/post.dart';
import 'package:yummy_app/features/components/post_item.dart';

class PostSection extends StatelessWidget {
  const PostSection({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Friend\'s Activity',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
           shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => PostItems(post: posts[index],

            ),
            itemCount: posts.length,
          ),

        ],
      ),
    );
  }
}
