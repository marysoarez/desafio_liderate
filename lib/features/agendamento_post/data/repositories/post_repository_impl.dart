import '../../domain/entities/agendamento_post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_local_datasource.dart';

class PostRepositoryImpl implements PostRepository {
  final PostLocalDatasource datasource;

  PostRepositoryImpl(this.datasource);

  @override
  Future<void> savePost(AgendamentoPost post) {
    return datasource.savePost(post);
  }

  @override
  Future<List<AgendamentoPost>> getPostsByDate(DateTime date) {
    return datasource.getPostsByDate(date);
  }
}
