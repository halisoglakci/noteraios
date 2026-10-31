import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Notera Giriş Ekranı',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 32),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}










/*
LoginScreen
    ↓
StatelessWidget
    ↓
Scaffold
 ├── AppBar → "Giriş"
 └── body
      └── Center
           └── Text                 
-> Burada özellikle yeni bir konu yok. HomeScreen'de kullandığımız yapının aynısını kullanıyoruz:

Padding Nedir?                  -> Ekrandaki elemanların telefonun kenarlarına yapışmasını engelliyor.
body: Padding(
  padding: const EdgeInsets.all(24.0),

EdgeInsets.all(24.0)            -> Dört taraftan 24 birim boşluk bırak demek

Column Nedir?                   -> Widget'ları dikey olarak alt alta dizer.
child: Column(
  children: [

mainAxisAlignment: MainAxisAlignment.center       -> bu grubun ekranda dikey olarak ortalanmasını sağlar.

SizedBox Nedir?
const SizedBox(height: 16),          -> İki widget arasına 16 birim boşluk koyuyor. Yani burada tasarım amacıyla kullanıyoruz.

TextField Nedir?                 -> kullanıcının klavyeyle veri girebildiği alan.
const TextField(
  decoration: InputDecoration(
    labelText: 'Kullanıcı Adı',
    border: OutlineInputBorder(),
  ),
),

InputDecoration: Kullanıcının klavyeye veri girebildiği alanın nasıl görüneceğini belirler.

obscureText: true,               -> yazılan şifreyi açık açık göstermek yerine gizliyor.

Navigator.pushReplacement(...)                                -> LoginScreen, HomeScreen açılırken navigation stack'ten çıkarılıyor.
Ana sayfada şu şekilde kullanmıştık: Navigator.push(...)      -> Burada yeni ekranı mevcut ekranın üstüne ekliyordu. Bu şekilde önceki ekrana gelebiliyorduk. Ancak Login ekranına tekrar gelmemiz gerekmediği için Navigator.pushReplacement(...) kullandık.
*/