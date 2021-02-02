// AllNews Model Class for News View

class AllNewsModel {
  int status;
  Data data;

  AllNewsModel({this.status, this.data});

  AllNewsModel.fromJson(Map<String, dynamic> json) {
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
  Br br;
  Stw stw;
  Br creative;

  Data({this.br, this.stw, this.creative});

  Data.fromJson(Map<String, dynamic> json) {
    br = json['br'] != null ? new Br.fromJson(json['br']) : null;
    stw = json['stw'] != null ? new Stw.fromJson(json['stw']) : null;
    creative =
        json['creative'] != null ? new Br.fromJson(json['creative']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.br != null) {
      data['br'] = this.br.toJson();
    }
    if (this.stw != null) {
      data['stw'] = this.stw.toJson();
    }
    if (this.creative != null) {
      data['creative'] = this.creative.toJson();
    }
    return data;
  }
}

class Br {
  String hash;
  String date;
  String image;
  List<Motds> motds;
  List<Messages> messages;

  Br({this.hash, this.date, this.image, this.motds, this.messages});

  Br.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    date = json['date'];
    image = json['image'];
    if (json['motds'] != null) {
      motds = <Motds>[];
      json['motds'].forEach((v) {
        motds.add(new Motds.fromJson(v));
      });
    }
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['date'] = this.date;
    data['image'] = this.image;
    if (this.motds != null) {
      data['motds'] = this.motds.map((v) => v.toJson()).toList();
    }
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Motds {
  String id;
  String title;
  String tabTitle;
  String body;
  String image;
  String tileImage;
  int sortingPriority;
  bool hidden;
  String videoId;

  Motds(
      {this.id,
      this.title,
      this.tabTitle,
      this.body,
      this.image,
      this.tileImage,
      this.sortingPriority,
      this.hidden,
      this.videoId});

  Motds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    tabTitle = json['tabTitle'];
    body = json['body'];
    image = json['image'];
    tileImage = json['tileImage'];
    sortingPriority = json['sortingPriority'];
    hidden = json['hidden'];
    videoId = json['videoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['tabTitle'] = this.tabTitle;
    data['body'] = this.body;
    data['image'] = this.image;
    data['tileImage'] = this.tileImage;
    data['sortingPriority'] = this.sortingPriority;
    data['hidden'] = this.hidden;
    data['videoId'] = this.videoId;
    return data;
  }
}

class Messages {
  String title;
  String body;
  String image;
  String adspace;

  Messages({this.title, this.body, this.image, this.adspace});

  Messages.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    image = json['image'];
    adspace = json['adspace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    data['adspace'] = this.adspace;
    return data;
  }
}

class Stw {
  String hash;
  String date;
  String image;
  List<Motds> motds;
  List<Messages> messages;

  Stw({this.hash, this.date, this.image, this.motds, this.messages});

  Stw.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    date = json['date'];
    image = json['image'];
    motds = json['motds'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['date'] = this.date;
    data['image'] = this.image;
    data['motds'] = this.motds;
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
