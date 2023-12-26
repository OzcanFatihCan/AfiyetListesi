import 'models/models.dart';

abstract class PostRepository {
  //food create
  Future<Post> createPost(Post food);

  //get food
  Future<List<Post>> getPost();
}
