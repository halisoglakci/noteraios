import 'package:flutter/material.dart';

import '../data/sample_songs.dart';
import '../models/song.dart';
import 'song_detail_screen.dart';

class SongListScreen extends StatelessWidget {
  const SongListScreen({super.key});

  // API'den veri çekiliyormuş gibi simüle eden metot (İleride buraya http.get yazılacak)
  Future<List<Song>> _fetchSongs() async {
    // Veri internetten geliyormuş gibi 2 saniye bekletiyoruz
    await Future.delayed(const Duration(seconds: 2));

    return sampleSongs; // Halis API'yi bitirene kadar sahte veriyi döndür
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Şarkılar')),
      // FutureBuilder: Gelecekteki bir veriyi bekleyip ona göre ekran çizer
      body: FutureBuilder<List<Song>>(
        future: _fetchSongs(), // Beklenecek metodu veriyoruz
        builder: (context, snapshot) {
          // 1. DURUM: Yükleniyor (Bekleme)
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Dönen yuvarlak yükleniyor animasyonu
            );
          }
          // 2. DURUM: Hata oluşması
          else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Şarkılar yüklenirken hata oluştu!\nDetay: ${snapshot.error}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }
          // 3. DURUM: Verinin başarıyla gelmesi
          else if (snapshot.hasData) {
            final songs = snapshot.data!;
            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  leading: const Icon(Icons.music_note),
                  title: Text(song.title),
                  subtitle: Text(song.artist),
                  // Tıklama özelliği (Bu eklendiğinde import uyarısı gider)
                  onTap: () {
                    // Tıklanan şarkının detay sayfasına geçiş
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongDetailScreen(song: song),
                      ),
                    );
                  },
                );
              },
            );
          }

          // 4. DURUM: Verinin boş olması
          return const Center(child: Text('Henüz şarkı bulunamadı.'));
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
