import 'package:desafio_liderate/features/agendamento_post/presentation/pages/post_calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/storage/local_storage.dart';
import 'features/agendamento_post/data/datasources/post_local_datasource.dart';
import 'features/agendamento_post/data/repositories/post_repository_impl.dart';
import 'features/agendamento_post/domain/repositories/post_repository.dart';

import 'features/agendamento_post/presentation/pages/post_form_page.dart';
import 'features/agendamento_post/presentation/state/agendamento_post_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final localStorage = await LocalStorage.getInstance();

  runApp(
    MultiProvider(
      providers: [
    Provider<PostRepository>(
    create: (_) => PostRepositoryImpl(PostLocalDatasourceImpl()),
  ),

  ChangeNotifierProvider<AgendamentoPostProvider>(
    create: (_) => AgendamentoPostProvider(localStorage)..loadPosts(),
  ),
      ],
      child: MyApp(),
    ),
  );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AgendamentoScreen(),
      routes: {
        '/postForm': (context) => const PostFormPage(),
      },
    );
  }
}
