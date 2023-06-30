import 'package:assignment/domain/model/post.dart';
import 'package:assignment/domain/repository/post_repository.dart';

class GetPostsUseCase {
  final PostRepository repository;

  const GetPostsUseCase({required this.repository});

  Future<List<Post>> call(int fromIndex, int limit) {
    return repository.getPosts(fromIndex, limit);
  }
}