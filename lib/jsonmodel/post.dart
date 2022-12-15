class Post{
  int userId;
  int id;
  String title;
  String body;

  Post({required this.userId, required this.id,required this.title, required this.body});

  factory Post.fromJson(Map <String, dynamic> Json){
    return Post(
        userId: Json['userId'],
        id: Json['id'],
        title: Json['title'],
        body: Json['body'],
    );
  }
}
