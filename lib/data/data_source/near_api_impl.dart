import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:assignment/data/data_source/near_api.dart';
import 'package:assignment/domain/model/post.dart';

class NearApiImpl implements NearApi {
  String _stringToBase64(String string) {
    final Codec<String, String> converter = utf8.fuse(base64);
    return converter.encode(string);
  }

  @override
  Future<List<Post>> getPosts(int fromIndex, int limit) async {
    final argsBase64 = _stringToBase64(
      '{"from_index":$fromIndex,"limit":$limit}',
    );

    final response = await http.post(
      Uri.parse('https://rpc.testnet.near.org'),
      headers: {
        'content-type': 'application/json',
      },
      body: jsonEncode({
        "jsonrpc": "2.0",
        "id": "dontcare",
        "method": "query",
        "params": {
          "request_type": "call_function",
          "finality": "final",
          "account_id": "dev-1652100430918-60749606761829",
          "method_name": "get_posts",
          "args_base64": argsBase64,
        }
      }),
    );

    if (response.statusCode == 200) {
      final resBody = jsonDecode(response.body);
      final resultList = List<int>.from(resBody['result']['result']);
      final jsonData = jsonDecode(utf8.decode(resultList));

      final listPosts = <Post>[];
      for (var element in jsonData) {
        listPosts.add(Post.fromJson(element));
      }
      return listPosts;
    } else {
      throw Exception('Get post fail');
    }
  }
}
