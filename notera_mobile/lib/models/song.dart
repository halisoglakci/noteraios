class Song {
  final int id;
  final String title;
  final String artist;

  Song({required this.id, required this.title, required this.artist});

  // İnternetten (API'den) gelen JSON verisini Song nesnesine dönüştüren metot
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      // Eğer backend'den veri boş gelirse program çökmesin diye varsayılan değerler atıyoruz
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Bilinmeyen Şarkı',
      artist: json['artist'] ?? 'Bilinmeyen Sanatçı',
    );
  }
}

/*
Burada bir şablon/class oluşturduk.

class Song    -> Song adında kendi veri tipimizi oluşturuyor.
final int id; -> Her şarkının benzersiz ID'si.

final String title;   -> Şarkının adı ve sanatçısı.
final String artist;

Neden "final"?        -> final kullanmamız, nesne oluşturulduktan sonra bu değerlerin değiştirilmemesini sağlıyor.

Constructor           -> Bir class'tan yeni nesne oluştururken çalışan özel yapı kanka.

Song({
  required this.id,
  required this.title,
  required this.artist,
});                   -> Bu kısım bir constructor. Yani "song" oluştururken bu üç bilgiyi vermek zorundayız. required tam olarak bunu söylüyor.

Yani aklında şu kalsın:
Class = şablon
Object/Nesne = o şablondan oluşturduğumuz şey
Constructor = nesneyi oluştururken başlangıç değerlerini veren yapı
*/
