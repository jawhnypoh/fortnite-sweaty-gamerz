// ItemShop Model Class for Item Shop Screen

class ItemShopModel {
  int status;
  Data data;

  ItemShopModel({this.status, this.data});

  ItemShopModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String date;
  List<Featured> featured;
  List<Daily> daily;

  Data({this.date, this.featured, this.daily});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['featured'] != null) {
      featured = <Featured>[];
      json['featured'].forEach((v) {
        featured.add(new Featured.fromJson(v));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily.add(new Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.featured != null) {
      data['featured'] = this.featured.map((v) => v.toJson()).toList();
    }
    if (this.daily != null) {
      data['daily'] = this.daily.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Featured {
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

  Featured(
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

  Featured.fromJson(Map<String, dynamic> json) {
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

class Daily {
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

  Daily(
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

  Daily.fromJson(Map<String, dynamic> json) {
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
  // String png;
  // bool gallery;
  // String featured;
  bool resizeAvailable;

  ShopImages({this.icon, this.resizeAvailable});

  ShopImages.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    // png = json['png'];
    // gallery = json['gallery'];
    // featured = json['featured'];
    resizeAvailable = json['resizeAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    // data['png'] = this.png;
    // data['gallery'] = this.gallery;
    // data['featured'] = this.featured;
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

class Images {
  String icon;
  bool png;
  bool gallery;
  bool featured;
  bool resizeAvailable;

  Images(
      {this.icon, this.png, this.gallery, this.featured, this.resizeAvailable});

  Images.fromJson(Map<String, dynamic> json) {
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
