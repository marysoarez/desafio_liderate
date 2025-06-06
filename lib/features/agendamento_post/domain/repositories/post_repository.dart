import '../entities/agendamento_post.dart';

abstract class PostRepository {
  Future<void> savePost(AgendamentoPost post);
  Future<List<AgendamentoPost>> getPostsByDate(DateTime date);
}
