import 'package:flutter/material.dart';
import 'package:notera_mobile/screens/song_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notera'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SongListScreen(),
              ),
            );
          },
          child: const Text('Şarkıları Gör'),
        ),
      ),
    );
  }
}










/*
Burada ana ekranımızı oluşturuyoruz.
Flutter'da Widget, ekranda gördüğümüz veya ekranı oluşturan yapı taşlarının genel adı.
Nesne-Widget Farkı: Flutter'daki widget'lar teknik olarak onlar da Dart nesneleri ama arayüzü tanımlamak için kullanılan özel nesneler.

import 'package:flutter/material.dart';       -> Flutter'ın hazır arayüz bileşenlerini kullanabilmemizi sağlıyor.

Örneğin; "Scaffold, AppBar, Text, Center" gibi şeyler Flutter'ın bize sağladığı widget'lar.

class HomeScreen extends StatelessWidget      -> HomeScreen adında kendi widget'ımızı oluşturuyoruz.

StatelessWidget                               -> Kabaca şu anlama gelir: Bu widget kendi içinde değişen bir durum/state tutmayacak.

const HomeScreen({super.key});                -> HomeScreen widget'ı oluşturulurken kullanılacak.

key                                           -> Flutter widget'ları takip ederken kullanıyor. 

@override
Widget build(BuildContext context) {          -> Flutter kabaca HomeScreen için: "Bu ekranı ekrana çizeceğim. Bana ne göstereceğimi söyle." diyor. Biz de build() içinde ekranın nasıl görüneceğini döndürüyoruz.

return Scaffold(                              -> Scaffold Nedir?: Flutter'daki standart bir ekranın temel iskeleti.

Flutter'daki standart bir ekranın temel iskeleti:   ->
Scaffold
│
├── AppBar
│   └── Notera
│
└── body
    └── Notera Ana Sayfa

AppBar                                        -> üst çubuk

body                                          -> ekranın ana içeriği

Center                                        -> içindeki widget'ı ekranın ortasına koyuyor.


Navigator.push(                               -> Mevcut ekranın üzerine yeni bir ekran aç.

onPressed: () {                               -> Butona basıldığında yapılacak işlemi belirliyor.

MaterialPageRoute(
  builder: (context) => const SongListScreen(),
)                                             -> Açacağın yeni sayfa SongListScreen olsun.

Yani bir bütün olarak:
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SongListScreen(),
  ),
);                                            -> SongListScreen'i Navigator'ın ekran yığınına ekle.
*/