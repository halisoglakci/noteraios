import 'package:flutter/material.dart';

import '../data/sample_songs.dart';

class SongListScreen extends StatelessWidget {
  const SongListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Şarkılar')),
      body: ListView.builder(
        itemCount: sampleSongs.length,
        itemBuilder: (context, index) {
          final song = sampleSongs[index];

          return ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(song.title),
            subtitle: Text(song.artist),
          );
        },
      ),
    );
  }
}

/*
Burada ilk kez oluşturduğumuz sampleSongs listesini gerçekten arayüzde göstereceğiz.

import '../data/sample_songs.dart';       -> Bu dosyada daha önce oluşturduğumuz sampleSongs listesini kullanacağımız için import ettik.

ListView.builder(                         -> Kaydırılabilir bir liste oluşturmak için kullanuılıyor.

itemCount: sampleSongs.length,            -> Listenin kaç eleman oluşturacağını söylüyor.

itemBuilder: (context, index) {           -> index: liste elemanlarını sırayla oluşturuyor.

final song = sampleSongs[index];          -> Verilen index'e ait Song nesnesini alıyoruz.

return ListTile(
  leading: const Icon(Icons.music_note),
  title: Text(song.title),
  subtitle: Text(song.artist),
);                                        -> ListTile: Flutter'ın liste satırları için sunduğu hazır bir widget

leading: Satırın başındaki alan
title: Ana yazı
subtitle: Altındaki küçük açıklama


*/
