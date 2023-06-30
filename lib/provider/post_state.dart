import 'package:assignment/domain/model/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

@freezed
abstract class PostState with _$PostState {
  const factory PostState({
    @Default(0) int currentIndex,
    @Default([]) List<Post> posts,
    @Default(true) bool isLoading,
    @Default(false) bool isLoadMoreDone,
  }) = _PostState;

  const PostState._();
}
