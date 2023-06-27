import 'package:flutter/material.dart';

class RepsScreen extends StatelessWidget {
  const RepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 20,
      separatorBuilder: (_, __) {
        return const SizedBox(height: 10.0);
      },
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (context, index) {
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          tileColor: Colors.white,
          leading: const CircleAvatar(),
          title: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Row(
                    children: [
                      Text(
                        'Vipul More',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '@vipulm',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Jun 26',
                        style: TextStyle(
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
              const Text(
                'Monday morning reminder - You can handle whatever this week throws at you.',
                style: TextStyle(
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
      },
    );
  }
}
