import 'package:assignment/data/data_source/near_api.dart';
import 'package:assignment/domain/model/post.dart';
import 'package:assignment/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final NearApi api;

  const PostRepositoryImpl({required this.api});

  @override
  Future<List<Post>> getPosts(int fromIndex, int limit) {
    return api.getPosts(fromIndex, limit);
  }
}