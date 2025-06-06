import 'package:flutter/material.dart';
import '../../domain/entities/agendamento_post.dart';
import '../../domain/usecases/save_post.dart';

class AgendamentoPostNotifier extends ChangeNotifier {
  final SavePost savePost;

  AgendamentoPostNotifier({required this.savePost});

  Future<void> save(AgendamentoPost post) async {
    await savePost(post);
    notifyListeners();
  }
}
