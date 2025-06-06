import '../../domain/entities/agendamento_post.dart';
import '../../domain/repositories/post_repository.dart';

class SavePost {
  final PostRepository repository;

  SavePost(this.repository);

  Future<void> call(AgendamentoPost post) {
    return repository.savePost(post);
  }
}
