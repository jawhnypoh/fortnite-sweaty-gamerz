// SingleItem Model class for Individual Item Screen

class SingleItemModel {
  String id;
  String name;
  String price;
  String priceIcon;
  String priceIconLink;
  ShopImages shopImages;
  String rarity;
  String type;
  String slug;
  String readableType;
  String description;
  bool bundleSet;
  bool bannerText;
  History history;

  SingleItemModel(
      {this.id,
      this.name,
      this.price,
      this.priceIcon,
      this.priceIconLink,
      this.shopImages,
      this.rarity,
      this.type,
      this.slug,
      this.readableType,
      this.description,
      this.bundleSet,
      this.bannerText,
      this.history});

  SingleItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    priceIcon = json['priceIcon'];
    priceIconLink = json['priceIconLink'];
    shopImages =
        json['images'] != null ? new ShopImages.fromJson(json['images']) : null;
    rarity = json['rarity'];
    type = json['type'];
    slug = json['slug'];
    readableType = json['readableType'];
    description = json['description'];
    bundleSet = json['bundleSet'];
    bannerText = json['bannerText'];
    history =
        json['history'] != null ? new History.fromJson(json['history']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['priceIcon'] = this.priceIcon;
    data['priceIconLink'] = this.priceIconLink;
    if (this.shopImages != null) {
      data['images'] = this.shopImages.toJson();
    }
    data['rarity'] = this.rarity;
    data['type'] = this.type;
    data['slug'] = this.slug;
    data['readableType'] = this.readableType;
    data['description'] = this.description;
    data['bundleSet'] = this.bundleSet;
    data['bannerText'] = this.bannerText;
    if (this.history != null) {
      data['history'] = this.history.toJson();
    }
    return data;
  }
}

class ShopImages {
  String icon;
  String png;
  String gallery;
  bool featured;
  bool resizeAvailable;

  ShopImages(
      {this.icon, this.png, this.gallery, this.featured, this.resizeAvailable});

  ShopImages.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    png = json['png'];
    gallery = json['gallery'];
    featured = json['featured'];
    resizeAvailable = json['resizeAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['png'] = this.png;
    data['gallery'] = this.gallery;
    data['featured'] = this.featured;
    data['resizeAvailable'] = this.resizeAvailable;
    return data;
  }
}

class History {
  int occurrences;
  String firstSeen;
  String lastSeen;
  List<String> dates;

  History({this.occurrences, this.firstSeen, this.lastSeen, this.dates});

  History.fromJson(Map<String, dynamic> json) {
    occurrences = json['occurrences'];
    firstSeen = json['firstSeen'];
    lastSeen = json['lastSeen'];
    dates = json['dates'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['occurrences'] = this.occurrences;
    data['firstSeen'] = this.firstSeen;
    data['lastSeen'] = this.lastSeen;
    data['dates'] = this.dates;
    return data;
  }
}
