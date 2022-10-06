import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload Image'),
        ),
        body: Column(
          children: [
            imageUrl != ''
                ? Image.network(imageUrl)
                : Placeholder(
                    fallbackHeight: 200.0,
                    fallbackWidth: double.infinity,
                  ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  uploadImage();
                },
                child: Text('Upload', style: TextStyle(fontSize: 16.0))),
          ],
        ));
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    XFile? image;

    // Check permissions
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      // Select Image
      image = (await _picker.pickImage(source: ImageSource.gallery))!;
      File file = File(image.path);

      if (image != null) {
        // Upload to Firebase
        var snapshot =
            await _storage.ref().child('folderName/imageName').putFile(file);
        var downloadURL = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadURL;
        });
      } else {
        print('No path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
}
