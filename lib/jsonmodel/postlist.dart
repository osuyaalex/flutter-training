import 'package:flutter_newwww/jsonmodel/post.dart';

class PostList{

  final List<Post> posts;

  PostList({required this.posts});

factory PostList.fromJson(List<dynamic> parsedJson){
  List<Post> posts =<Post>[];
  posts = parsedJson.map((i) => Post.fromJson(i)).toList();
  return PostList(posts: posts);
}
}


