class Chapiters {
  int? page;
  String? img;
  HeaderForImage? headerForImage;

  Chapiters({this.page, this.img, this.headerForImage});

  Chapiters.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    img = json['img'];
    headerForImage = json['headerForImage'] != null
        ? new HeaderForImage.fromJson(json['headerForImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['img'] = this.img;
    if (this.headerForImage != null) {
      data['headerForImage'] = this.headerForImage!.toJson();
    }
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
