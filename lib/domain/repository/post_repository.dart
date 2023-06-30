import 'package:assignment/domain/model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts(int fromIndex, int limit);
}