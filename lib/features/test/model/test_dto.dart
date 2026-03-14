class TestDto {
  final int year;
  final int month;
  final int rank;
  final String title;
  final String artist;
  final String genre;
  final String code;
  final List<String> lyricsKoLines;
  final List<String> lyricsJaLines;
  final List<String> lyricsJaRubyLines;

  TestDto({
    required this.year,
    required this.month,
    required this.rank,
    required this.title,
    required this.artist,
    required this.genre,
    required this.code,
    required this.lyricsKoLines,
    required this.lyricsJaLines,
    required this.lyricsJaRubyLines,
  });

  factory TestDto.fromJson(Map<String, dynamic> json) {
    return TestDto(
      year: json['year'],
      month: json['month'],
      rank: json['rank'],
      title: json['title'],
      artist: json['artist'],
      genre: json['genre'],
      code: json['code'],
      lyricsKoLines: List<String>.from(json['lyricsKoLines']),
      lyricsJaLines: List<String>.from(json['lyricsJaLines']),
      lyricsJaRubyLines: List<String>.from(json['lyricsJaRubyLines']),
    );
  }
}
