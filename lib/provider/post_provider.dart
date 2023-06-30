import 'dart:async';

import 'package:assignment/provider/post_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:assignment/data/data_source/near_api.dart';
import 'package:assignment/data/data_source/near_api_impl.dart';
import 'package:assignment/data/repository/post_repository_impl.dart';
import 'package:assignment/domain/repository/post_repository.dart';
import 'package:assignment/domain/use_cases/get_posts_use_case.dart';

final nearApiProvider = Provider<NearApi>((_) {
  return NearApiImpl();
});

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepositoryImpl(api: ref.read(nearApiProvider));
});

final getPostsUseCaseProvider = Provider<GetPostsUseCase>((ref) {
  return GetPostsUseCase(repository: ref.read(postRepositoryProvider));
});

final postProvider = StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier(getPostsUseCase: ref.watch(getPostsUseCaseProvider));
});

class PostNotifier extends StateNotifier<PostState> {
  final GetPostsUseCase getPostsUseCase;

  PostNotifier({required this.getPostsUseCase}) : super(const PostState()) {
    _initPosts();
  }

  Future<void> _initPosts() async {
    final posts = await getPostsUseCase(state.currentIndex, 10);

    if (posts.isEmpty) {
      state = state.copyWith(
        currentIndex: state.currentIndex,
        isLoading: false,
      );
      return;
    }

    state = state.copyWith(
      currentIndex: state.currentIndex,
      isLoading: false,
      posts: posts,
    );
  }

  Future<void> loadMorePost() async {
    if (state.isLoading) return;

    state = state.copyWith(
      isLoading: true,
      isLoadMoreDone: false,
    );

    final posts = await getPostsUseCase(state.currentIndex + 10, 10);

    if (posts.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        isLoadMoreDone: posts.isEmpty,
      );
    } else {
      state = state.copyWith(
        currentIndex: state.currentIndex + 10,
        isLoading: false,
        isLoadMoreDone: posts.isEmpty,
        posts: [...state.posts, ...posts],
      );
    }
  }
}
