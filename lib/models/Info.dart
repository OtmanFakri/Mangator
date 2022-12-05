class Info {
  String? id;
  String? title;
  String? description;
  Headers? headers;
  String? image;
  List<String>? genres;
  String? status;
  double? rating;
  List<String>? authors;
  List<Chapters>? chapters;

  Info(
      {this.id,
        this.title,
        this.description,
        this.headers,
        this.image,
        this.genres,
        this.status,
        this.rating,
        this.authors,
        this.chapters});

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];

    headers = json['headers'] != null ? new Headers.fromJson(json['headers']) : new Headers.fromJson(json['headerForImage']);

    image = json['image'];
    genres = json['genres'].cast<String>();
    status = json['status'];
    authors = json['authors'].cast<String>();
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(new Chapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.headers != null) {
      data['headers'] = this.headers!.toJson();
    }
    data['image'] = this.image;
    data['genres'] = this.genres;
    data['status'] = this.status;
    data['rating'] = this.rating;
    data['authors'] = this.authors;
    if (this.chapters != null) {
      data['chapters'] = this.chapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Headers {
  String? referer;

  Headers({this.referer});

  Headers.fromJson(Map<String, dynamic> json) {
    referer = json['Referer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Referer'] = this.referer;
    return data;
  }
}

class Chapters {
  String? id;
  String? title;
  String? releasedDate;

  Chapters({this.id, this.title, this.releasedDate});

  Chapters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    releasedDate = json['releasedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['releasedDate'] = this.releasedDate;
    return data;
  }
}
