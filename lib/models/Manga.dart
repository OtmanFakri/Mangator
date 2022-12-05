class Manga {
  String? id;
  String? title;
  HeaderForImage? headerForImage;
  String? image;
  String? description;
  String? status;

  Manga(
      {this.id,
        this.title,
        this.headerForImage,
        this.image,
        this.description,
        this.status});

  Manga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    headerForImage = json['headerForImage'] != null
        ? new HeaderForImage.fromJson(json['headerForImage'])
        : null;
    image = json['image'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.headerForImage != null) {
      data['headerForImage'] = this.headerForImage!.toJson();
    }
    data['image'] = this.image;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}

class HeaderForImage {
  String? referer;

  HeaderForImage({this.referer});

  HeaderForImage.fromJson(Map<String, dynamic> json) {
    referer = json['Referer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Referer'] = this.referer;
    return data;
  }
}
