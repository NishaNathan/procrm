import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:procrmapp/constants/constnts.dart';

class UploadAvatarImage extends StatefulWidget {
  const UploadAvatarImage({super.key});

  @override
  State<UploadAvatarImage> createState() => _UploadAvatarImageState();
}

class _UploadAvatarImageState extends State<UploadAvatarImage> {

  File? _image;

  // Function to open the image picker
   Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade400,
                  radius: 30,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(
                          Icons.camera_alt,
                          size: 25,
                          color: lightPurple,
                        )
                      : null,
                ),
              ),
    );
  }
}