import 'package:assignment/domain/model/post.dart';

abstract class NearApi {
  Future<List<Post>> getPosts(int fromIndex, int limit);
}