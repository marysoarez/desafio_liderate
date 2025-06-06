import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/agendamento_post_provider.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/post_card.dart';

class AgendamentoScreen extends StatefulWidget {
  const AgendamentoScreen({Key? key}) : super(key: key);

  @override
  State<AgendamentoScreen> createState() => _AgendamentoScreenState();
}

class _AgendamentoScreenState extends State<AgendamentoScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final provider = Provider.of<AgendamentoPostProvider>(context, listen: false);
    await provider.loadPosts();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgendamentoPostProvider>(context);

    final posts = provider.getPostsForDate(provider.selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário de Posts'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          CalendarWidget(
            selectedDate: provider.selectedDate,
            onDateSelected: (date) {
              provider.selectDate(date);
            },
            markedDates: provider.markedDates,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: posts.isEmpty
                ? const Center(child: Text('Nenhum post agendado para esse dia.'))
                : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostCard(post: post);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/postForm');
        },
        child: const Icon(Icons.add),
        tooltip: 'Novo Post',
      ),
    );
  }
}
