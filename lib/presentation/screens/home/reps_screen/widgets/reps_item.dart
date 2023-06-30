import 'package:assignment/domain/model/post.dart';
import 'package:flutter/material.dart';

class RepsItem extends StatelessWidget {
  final Post post;

  const RepsItem({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      tileColor: Colors.white,
      leading: CircleAvatar(
        backgroundImage: post.postType.url != null
            ? NetworkImage(post.postType.url!)
            : null,
      ),
      title: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  const Text(
                    'Vipul More',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    '@vipulm',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    post.time,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.more_horiz,
                ),
              ),
            ],
          ),
          Text(
            post.title,
            style: const TextStyle(
              fontSize: 13.0,
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.favorite_outline,
                ),
              ),
              const SizedBox(width: 5.0),
              const Text('0'),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.message_outlined,
                ),
              ),
              const SizedBox(width: 5.0),
              const Text('0'),
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.share_outlined,
                ),
              ),
              const SizedBox(width: 5.0),
              const Text('0'),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.upgrade_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
