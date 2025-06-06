import 'dart:io';

import 'package:desafio_liderate/features/agendamento_post/presentation/state/agendamento_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/agendamento_post.dart';
import '../widgets/image_carousel.dart';
import '../widgets/input_field.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/time_picker_field.dart';

class PostFormPage extends StatefulWidget {
  const PostFormPage({super.key});

  @override
  State<PostFormPage> createState() => _PostFormPageState();
}

class _PostFormPageState extends State<PostFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  List<File> _selectedImages = [];

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedDate != null && _selectedTime != null) {
      final dateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      final post = AgendamentoPost(
        id: const Uuid().v4(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        dateTime: dateTime,
        imagePaths: _selectedImages.map((f) => f.path).toList(),
      );


      context.read<AgendamentoPostProvider>().addPost(post);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos corretamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Agendamento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              InputField(
                controller: _titleController,
                label: 'Título',
                validator: (value) => value == null || value.isEmpty ? 'Informe o título' : null,
              ),
              const SizedBox(height: 16),
              InputField(
                controller: _descriptionController,
                label: 'Descrição',
                validator: (value) => value == null || value.isEmpty ? 'Informe a descrição' : null,
              ),
              const SizedBox(height: 16),
              DatePickerField(
                label: 'Selecionar Data',
                selectedDate: _selectedDate,
                onDateSelected: (date) {
                  setState(() => _selectedDate = date);
                },
              ),
              const SizedBox(height: 16),
              TimePickerField(
                label: 'Selecionar Hora',
                selectedTime: _selectedTime,
                onTimeSelected: (time) {
                  setState(() => _selectedTime = time);
                },
              ),
              const SizedBox(height: 16),
            ImageCarousel(
              onImagesSelected: (files) {
                setState(() {
                  _selectedImages = files;
                });
              },
            ),
            const SizedBox(height: 16),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Salvar Agendamento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
