import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const NoteraApp());
}

class NoteraApp extends StatelessWidget {
  const NoteraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notera',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}















/*
import 'screens/home_screen.dart';    -> yazdığımız HomeScreen'i main.dart içinde kullanılabilir hale getirdik.

void main() {
  runApp(const NoteraApp());
}                                     -> Uygulamanın başlama noktası 

main()                                -> Dart uygulaması buradan çalışmaya başlıyor

runApp()                              -> Flutter'a “bu widget'ı uygulamanın kökü olarak çalıştır” diyor. İçine de hemen alt satırında tanımlayacak olduğumuz kendi widget'ımız olan NoteraApp'ı veriyoruz.

class NoteraApp extends StatelessWidget {       -> Flutter'ın hazır verdiği StatelessWidget widget'ından faydalanarak kendi widget'ımız olan NoteraApp widget'ımızı tanımlıyoruz.

MaterialApp(
  title: 'Notera',
  debugShowCheckedModeBanner: false,
  home: const HomeScreen(),
)                                     -> Uygulamanın genel yapısını oluşturuyor. 

home: const HomeScreen(),             -> Notera açıldığında ilk olarak HomeScreen göster.

debugShowCheckedModeBanner: false     -> emülatörde sağ üstte çıkan kırmızı DEBUG yazısını kaldırıyor
*/