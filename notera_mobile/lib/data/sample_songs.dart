import '../models/song.dart';

final List<Song> sampleSongs = [
  Song(
    id: 1,
    title: 'Gülpembe',
    artist: 'Barış Manço',
  ),
  Song(
    id: 2,
    title: 'Gonca Mualla',
    artist: 'Başar Keklik',
  ),
  Song(
    id: 3,
    title: 'Bir Derdim Var',
    artist: 'Mor ve Ötesi',
  ),
];









/*
Burada; import ettiğimiz song.dart dosyasında oluşturduğumuz şablondan Song() diyerek yeni nesneler üretiyoruz.

import '../models/song.dart';         -> Song class'ını kullanabilmem için song.dart dosyasını buraya dahil et.

final List<Song> sampleSongs = [      -> Song nesnelerinden oluşan bir liste tanımlıyor.

Song(
  id: 1,
  title: 'Gülpembe',
  artist: 'Barış Manço',
),                                     -> ifadesi ile; import ettiğimiz song.dart dosyasında oluşturduğumuz şablondan bir nesne(object) üretiyoruz. 
*/