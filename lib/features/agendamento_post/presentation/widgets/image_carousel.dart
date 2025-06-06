import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageCarousel extends StatefulWidget {
  final Function(List<File>) onImagesSelected;

  const ImageCarousel({super.key, required this.onImagesSelected});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List<File> _images = [];

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      final files = pickedFiles.map((e) => File(e.path)).toList();
      setState(() {
        _images = files;
      });
      widget.onImagesSelected(files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImages,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        child: _images.isNotEmpty
            ? ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _images.length,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                _images[index],
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
            : const Center(
          child: Icon(Icons.add_photo_alternate, size: 40, color: Colors.grey),
        ),
      ),
    );
  }
}
