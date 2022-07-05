class Movie {
  String? name;
  String? genre;
  int? year;

  Movie({this.name, this.genre, this.year});

  Movie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    genre = json['genre'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['genre'] = this.genre;
    data['year'] = this.year;
    return data;
  }
}
