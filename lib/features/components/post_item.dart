import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/post.dart';

class PostItems extends StatelessWidget {
  const PostItems({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(post.profileImageUrl),
        ),
        title: Text(post.comment,
         style: textTheme.titleMedium,
        ),
        subtitle: Text('${post.timestamp} Minutes Ago',
          style: textTheme.bodySmall,
        ),
      ),

    );
  }
}

