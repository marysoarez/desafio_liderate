import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../../core/storage/local_storage.dart';
import '../../domain/entities/agendamento_post.dart';

class AgendamentoPostProvider with ChangeNotifier {
  final List<AgendamentoPost> _posts = [];
  final LocalStorage _localStorage;

  AgendamentoPostProvider(this._localStorage);

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  List<AgendamentoPost> getPostsForDate(DateTime date) {
    return _posts.where((p) =>
    p.dateTime.year == date.year &&
        p.dateTime.month == date.month &&
        p.dateTime.day == date.day
    ).toList();
  }

  List<DateTime> get markedDates {
    return _posts
        .map((p) => DateTime(p.dateTime.year, p.dateTime.month, p.dateTime.day))
        .toSet()
        .toList();
  }

  void addPost(AgendamentoPost post) {
    _posts.add(post);
    savePosts();
    notifyListeners();
  }

  Future<void> loadPosts() async {
    final String? postsJson = _localStorage.getString('scheduled_posts');
    if (postsJson != null) {
      final List<dynamic> decodedList = jsonDecode(postsJson);
      _posts.clear();
      _posts.addAll(decodedList.map((json) => AgendamentoPost.fromJson(json)));
      notifyListeners();
    }
  }

  Future<void> savePosts() async {
    final List<Map<String, dynamic>> jsonList = _posts.map((p) => p.toJson()).toList();
    await _localStorage.setString('scheduled_posts', jsonEncode(jsonList));
  }
}
