import 'package:flutter/material.dart';

import '../models/song.dart';
import 'song_detail_screen.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/api_config.dart';

class SongListScreen extends StatefulWidget {
  const SongListScreen({super.key});

  @override
  State<SongListScreen> createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  String searchQuery = '';

  late Future<List<Song>> songsFuture;

  @override
  void initState() {
    super.initState();
    songsFuture = _fetchSongs();
  }

  
  Future<List<Song>> _fetchSongs() async {
    
    final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/songs'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData
          .map((item) => Song.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Şarkılar alınamadı. HTTP durum kodu: ${response.statusCode}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Şarkılar')),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Şarkı veya sanatçı ara...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Song>>(
              future: songsFuture,
              builder: (context, snapshot) {
                
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Şarkılar yüklenirken hata oluştu!\nDetay: ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  );

                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final songs = snapshot.data!.where((song) {
                    final query = searchQuery.toLowerCase().trim();

                    return song.title.toLowerCase().contains(query) ||
                        song.artist.toLowerCase().contains(query);
                  }).toList();

                  if (songs.isEmpty) {
                    return const Center(
                      child: Text('Aramanızla eşleşen şarkı bulunamadı.'),
                    );
                  }
                  return ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      final song = songs[index];
                      return ListTile(
                        leading: const Icon(Icons.music_note),
                        title: Text(song.title),
                        subtitle: Text(song.artist),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SongDetailScreen(song: song),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                
                return const Center(child: Text('Henüz şarkı bulunamadı.'));
              },
            ), // FutureBuilder kapanışı
          ), // Expanded kapanışı
        ], // Column children kapanışı
      ), // Column kapanışı
    );
  }
}
