import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/agendamento_post.dart';

abstract class PostLocalDatasource {
  Future<void> savePost(AgendamentoPost post);
  Future<List<AgendamentoPost>> getPostsByDate(DateTime date);
  Future<List<AgendamentoPost>> getAllPosts();
}

class PostLocalDatasourceImpl implements PostLocalDatasource {
  static const _key = 'scheduled_posts';

  List<AgendamentoPost> _cache = [];

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? postsJson = prefs.getString(_key);
    if (postsJson != null) {
      final List<dynamic> decodedList = jsonDecode(postsJson);
      _cache = decodedList.map((json) => AgendamentoPost.fromJson(json)).toList();
    }
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList = _cache.map((p) => p.toJson()).toList();
    await prefs.setString(_key, jsonEncode(jsonList));
  }

  @override
  Future<void> savePost(AgendamentoPost post) async {
    await _loadFromPrefs();
    _cache.add(post);
    await _saveToPrefs();
  }

  @override
  Future<List<AgendamentoPost>> getPostsByDate(DateTime date) async {
    await _loadFromPrefs();
    return _cache.where((p) =>
    p.dateTime.year == date.year &&
        p.dateTime.month == date.month &&
        p.dateTime.day == date.day
    ).toList();
  }

  @override
  Future<List<AgendamentoPost>> getAllPosts() async {
    await _loadFromPrefs();
    return _cache;
  }
}
