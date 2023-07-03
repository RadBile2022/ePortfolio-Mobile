import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Post'),
        ),
        body: MyPostForm(),
      ),
    );
  }
}

class MyPostForm extends StatefulWidget {
  @override
  _MyPostFormState createState() => _MyPostFormState();
}

class _MyPostFormState extends State<MyPostForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();

  void _submitPost() {
    if (_formKey.currentState!.validate()) {
      // Jika data post valid, lakukan tindakan yang sesuai (simpan ke database, dll.)
      String postText = _postController.text;
      print('Postingan Anda: $postText');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _postController,
              decoration: InputDecoration(
                labelText: 'Tulis Postingan Anda',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Untuk memungkinkan postingan memiliki jumlah baris yang tidak terbatas
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Isi postingan tidak boleh kosong';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
