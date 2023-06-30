import 'package:assignment/provider/post_provider.dart';
import 'package:flutter/material.dart';

import 'package:assignment/presentation/screens/home/reps_screen/widgets/bottom_loader.dart';
import 'package:assignment/presentation/screens/home/reps_screen/widgets/reps_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepsScreen extends ConsumerStatefulWidget {
  const RepsScreen({super.key});

  @override
  ConsumerState<RepsScreen> createState() => _RepsScreenState();
}

class _RepsScreenState extends ConsumerState<RepsScreen> with AutomaticKeepAliveClientMixin<RepsScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() async {
        if (_scrollController.position.pixels >
            _scrollController.position.maxScrollExtent -
                MediaQuery.of(context).size.height) {
            ref.read(postProvider.notifier).loadMorePost();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final listPosts = ref.watch(postProvider).posts;
    final isLoading = ref.watch(postProvider).isLoading;
    final isLoadMoreDone = ref.watch(postProvider).isLoadMoreDone;

    if (listPosts.isEmpty) {
      if (!isLoading) {
        return const Center(
          child: Text('Error'),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: isLoadMoreDone ? listPosts.length : listPosts.length + 1,
      separatorBuilder: (_, __) {
        return const SizedBox(height: 10.0);
      },
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (context, index) {
        return index == listPosts.length
            ? const BottomLoader()
            : RepsItem(post: listPosts[index]);
      },
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
