class Song {
  final int id;
  final String title;
  final String artist;

  Song({required this.id, required this.title, required this.artist});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Bilinmeyen Şarkı',
      artist: json['artist'] ?? 'Bilinmeyen Sanatçı',
    );
  }
}
