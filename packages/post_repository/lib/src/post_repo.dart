import 'models/models.dart';

abstract class PostRepository {
  //post create
  Future<Post> createPost(Post food);

  //get post
  Future<List<Post>> getPost(String userId);

  //delete post
  Future<void> deletePost(String userId, String postId);

  //update post
  Future<Post> updatePost(Post post);
}
