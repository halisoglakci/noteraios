import 'package:flutter/material.dart';

import '../models/song.dart';

class SongDetailScreen extends StatelessWidget {
  final Song song; // Tıklanan şarkının verisini tutacak değişken

  const SongDetailScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Şarkı Detayı')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Sanatçı: ${song.artist}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            // Projenizin veritabanı yapısına (Notlar ve Enstrümanlar tablolarına) atıf
            const Text(
              'Gelecek Özellikler:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const ListTile(
              leading: Icon(Icons.edit_note),
              title: Text('Bu şarkıya ait değerlendirme notları'),
            ),
            const ListTile(
              leading: Icon(Icons.piano),
              title: Text('Kullanılan enstrümanlar'),
            ),
          ],
        ),
      ),
    );
  }
}
