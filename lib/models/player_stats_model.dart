// PlayerStats Model Class for Player Stats Screen
class PlayerStatsModel {
  int status;
  Data data;

  PlayerStatsModel({this.status, this.data});

  PlayerStatsModel.fromJson(Map<String, dynamic> json) {
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
  Account account;
  BattlePass battlePass;
  Null image;
  Stats stats;

  Data({this.account, this.battlePass, this.image, this.stats});

  Data.fromJson(Map<String, dynamic> json) {
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    battlePass = json['battlePass'] != null
        ? new BattlePass.fromJson(json['battlePass'])
        : null;
    image = json['image'];
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    if (this.battlePass != null) {
      data['battlePass'] = this.battlePass.toJson();
    }
    data['image'] = this.image;
    if (this.stats != null) {
      data['stats'] = this.stats.toJson();
    }
    return data;
  }
}

class Account {
  String id;
  String name;

  Account({this.id, this.name});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class BattlePass {
  int level;
  int progress;

  BattlePass({this.level, this.progress});

  BattlePass.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['progress'] = this.progress;
    return data;
  }
}

class Stats {
  All all;
  All keyboardMouse;
  All gamepad;

  Stats({this.all, this.keyboardMouse, this.gamepad});

  Stats.fromJson(Map<String, dynamic> json) {
    all = json['all'] != null ? new All.fromJson(json['all']) : null;
    keyboardMouse = json['keyboardMouse'] != null
        ? new All.fromJson(json['keyboardMouse'])
        : null;
    gamepad =
        json['gamepad'] != null ? new All.fromJson(json['gamepad']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.all != null) {
      data['all'] = this.all.toJson();
    }
    if (this.keyboardMouse != null) {
      data['keyboardMouse'] = this.keyboardMouse.toJson();
    }
    if (this.gamepad != null) {
      data['gamepad'] = this.gamepad.toJson();
    }
    return data;
  }
}

class All {
  Overall overall;
  Solo solo;
  Duo duo;
  Trio trio;
  Squad squad;
  Ltm ltm;

  All({this.overall, this.solo, this.duo, this.trio, this.squad, this.ltm});

  All.fromJson(Map<String, dynamic> json) {
    overall =
        json['overall'] != null ? new Overall.fromJson(json['overall']) : null;
    solo = json['solo'] != null ? new Solo.fromJson(json['solo']) : null;
    duo = json['duo'] != null ? new Duo.fromJson(json['duo']) : null;
    trio = json['trio'] != null ? new Trio.fromJson(json['trio']) : null;
    squad = json['squad'] != null ? new Squad.fromJson(json['squad']) : null;
    ltm = json['ltm'] != null ? new Ltm.fromJson(json['ltm']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.overall != null) {
      data['overall'] = this.overall.toJson();
    }
    if (this.solo != null) {
      data['solo'] = this.solo.toJson();
    }
    if (this.duo != null) {
      data['duo'] = this.duo.toJson();
    }
    if (this.trio != null) {
      data['trio'] = this.trio.toJson();
    }
    if (this.squad != null) {
      data['squad'] = this.squad.toJson();
    }
    if (this.ltm != null) {
      data['ltm'] = this.ltm.toJson();
    }
    return data;
  }
}

class Overall {
  int score;
  double scorePerMin;
  double scorePerMatch;
  int wins;
  int top3;
  int top5;
  int top6;
  int top10;
  int top12;
  int top25;
  int kills;
  double killsPerMin;
  double killsPerMatch;
  int deaths;
  double kd;
  int matches;
  double winRate;
  int minutesPlayed;
  int playersOutlived;
  String lastModified;

  Overall(
      {this.score,
      this.scorePerMin,
      this.scorePerMatch,
      this.wins,
      this.top3,
      this.top5,
      this.top6,
      this.top10,
      this.top12,
      this.top25,
      this.kills,
      this.killsPerMin,
      this.killsPerMatch,
      this.deaths,
      this.kd,
      this.matches,
      this.winRate,
      this.minutesPlayed,
      this.playersOutlived,
      this.lastModified});

  Overall.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    scorePerMin = json['scorePerMin'];
    scorePerMatch = json['scorePerMatch'];
    wins = json['wins'];
    top3 = json['top3'];
    top5 = json['top5'];
    top6 = json['top6'];
    top10 = json['top10'];
    top12 = json['top12'];
    top25 = json['top25'];
    kills = json['kills'];
    killsPerMin = json['killsPerMin'];
    killsPerMatch = json['killsPerMatch'];
    deaths = json['deaths'];
    kd = json['kd'];
    matches = json['matches'];
    winRate = json['winRate'];
    minutesPlayed = json['minutesPlayed'];
    playersOutlived = json['playersOutlived'];
    lastModified = json['lastModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['scorePerMin'] = this.scorePerMin;
    data['scorePerMatch'] = this.scorePerMatch;
    data['wins'] = this.wins;
    data['top3'] = this.top3;
    data['top5'] = this.top5;
    data['top6'] = this.top6;
    data['top10'] = this.top10;
    data['top12'] = this.top12;
    data['top25'] = this.top25;
    data['kills'] = this.kills;
    data['killsPerMin'] = this.killsPerMin;
    data['killsPerMatch'] = this.killsPerMatch;
    data['deaths'] = this.deaths;
    data['kd'] = this.kd;
    data['matches'] = this.matches;
    data['winRate'] = this.winRate;
    data['minutesPlayed'] = this.minutesPlayed;
    data['playersOutlived'] = this.playersOutlived;
    data['lastModified'] = this.lastModified;
    return data;
  }
}

class Solo {
  int score;
  double scorePerMin;
  double scorePerMatch;
  int wins;
  int top10;
  int top25;
  int kills;
  double killsPerMin;
  double killsPerMatch;
  int deaths;
  double kd;
  int matches;
  double winRate;
  int minutesPlayed;
  int playersOutlived;
  String lastModified;

  Solo(
      {this.score,
      this.scorePerMin,
      this.scorePerMatch,
      this.wins,
      this.top10,
      this.top25,
      this.kills,
      this.killsPerMin,
      this.killsPerMatch,
      this.deaths,
      this.kd,
      this.matches,
      this.winRate,
      this.minutesPlayed,
      this.playersOutlived,
      this.lastModified});

  Solo.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    scorePerMin = json['scorePerMin'];
    scorePerMatch = json['scorePerMatch'];
    wins = json['wins'];
    top10 = json['top10'];
    top25 = json['top25'];
    kills = json['kills'];
    killsPerMin = json['killsPerMin'];
    killsPerMatch = json['killsPerMatch'];
    deaths = json['deaths'];
    kd = json['kd'];
    matches = json['matches'];
    winRate = json['winRate'];
    minutesPlayed = json['minutesPlayed'];
    playersOutlived = json['playersOutlived'];
    lastModified = json['lastModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['scorePerMin'] = this.scorePerMin;
    data['scorePerMatch'] = this.scorePerMatch;
    data['wins'] = this.wins;
    data['top10'] = this.top10;
    data['top25'] = this.top25;
    data['kills'] = this.kills;
    data['killsPerMin'] = this.killsPerMin;
    data['killsPerMatch'] = this.killsPerMatch;
    data['deaths'] = this.deaths;
    data['kd'] = this.kd;
    data['matches'] = this.matches;
    data['winRate'] = this.winRate;
    data['minutesPlayed'] = this.minutesPlayed;
    data['playersOutlived'] = this.playersOutlived;
    data['lastModified'] = this.lastModified;
    return data;
  }
}

class Duo {
  int score;
  double scorePerMin;
  double scorePerMatch;
  int wins;
  int top5;
  int top12;
  int kills;
  double killsPerMin;
  double killsPerMatch;
  int deaths;
  double kd;
  int matches;
  double winRate;
  int minutesPlayed;
  int playersOutlived;
  String lastModified;

  Duo(
      {this.score,
      this.scorePerMin,
      this.scorePerMatch,
      this.wins,
      this.top5,
      this.top12,
      this.kills,
      this.killsPerMin,
      this.killsPerMatch,
      this.deaths,
      this.kd,
      this.matches,
      this.winRate,
      this.minutesPlayed,
      this.playersOutlived,
      this.lastModified});

  Duo.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    scorePerMin = json['scorePerMin'];
    scorePerMatch = json['scorePerMatch'];
    wins = json['wins'];
    top5 = json['top5'];
    top12 = json['top12'];
    kills = json['kills'];
    killsPerMin = json['killsPerMin'];
    killsPerMatch = json['killsPerMatch'];
    deaths = json['deaths'];
    kd = json['kd'];
    matches = json['matches'];
    winRate = json['winRate'];
    minutesPlayed = json['minutesPlayed'];
    playersOutlived = json['playersOutlived'];
    lastModified = json['lastModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['scorePerMin'] = this.scorePerMin;
    data['scorePerMatch'] = this.scorePerMatch;
    data['wins'] = this.wins;
    data['top5'] = this.top5;
    data['top12'] = this.top12;
    data['kills'] = this.kills;
    data['killsPerMin'] = this.killsPerMin;
    data['killsPerMatch'] = this.killsPerMatch;
    data['deaths'] = this.deaths;
    data['kd'] = this.kd;
    data['matches'] = this.matches;
    data['winRate'] = this.winRate;
    data['minutesPlayed'] = this.minutesPlayed;
    data['playersOutlived'] = this.playersOutlived;
    data['lastModified'] = this.lastModified;
    return data;
  }
}

class Trio {
  int score;
  double scorePerMin;
  double scorePerMatch;
  int wins;
  int top3;
  int top6;
  int kills;
  double killsPerMin;
  double killsPerMatch;
  int deaths;
  double kd;
  int matches;
  double winRate;
  int minutesPlayed;
  int playersOutlived;
  String lastModified;

  Trio(
      {this.score,
      this.scorePerMin,
      this.scorePerMatch,
      this.wins,
      this.top3,
      this.top6,
      this.kills,
      this.killsPerMin,
      this.killsPerMatch,
      this.deaths,
      this.kd,
      this.matches,
      this.winRate,
      this.minutesPlayed,
      this.playersOutlived,
      this.lastModified});

  Trio.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    scorePerMin = json['scorePerMin'];
    scorePerMatch = json['scorePerMatch'];
    wins = json['wins'];
    top3 = json['top3'];
    top6 = json['top6'];
    kills = json['kills'];
    killsPerMin = json['killsPerMin'];
    killsPerMatch = json['killsPerMatch'];
    deaths = json['deaths'];
    kd = json['kd'];
    matches = json['matches'];
    winRate = json['winRate'];
    minutesPlayed = json['minutesPlayed'];
    playersOutlived = json['playersOutlived'];
    lastModified = json['lastModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['scorePerMin'] = this.scorePerMin;
    data['scorePerMatch'] = this.scorePerMatch;
    data['wins'] = this.wins;
    data['top3'] = this.top3;
    data['top6'] = this.top6;
    data['kills'] = this.kills;
    data['killsPerMin'] = this.killsPerMin;
    data['killsPerMatch'] = this.killsPerMatch;
    data['deaths'] = this.deaths;
    data['kd'] = this.kd;
    data['matches'] = this.matches;
    data['winRate'] = this.winRate;
    data['minutesPlayed'] = this.minutesPlayed;
    data['playersOutlived'] = this.playersOutlived;
    data['lastModified'] = this.lastModified;
    return data;
  }
}

class Ltm {
  int score;
  double scorePerMin;
  double scorePerMatch;
  int wins;
  int kills;
  double killsPerMin;
  double killsPerMatch;
  int deaths;
  double kd;
  int matches;
  double winRate;
  int minutesPlayed;
  int playersOutlived;
  String lastModified;

  Ltm(
      {this.score,
      this.scorePerMin,
      this.scorePerMatch,
      this.wins,
      this.kills,
      this.killsPerMin,
      this.killsPerMatch,
      this.deaths,
      this.kd,
      this.matches,
      this.winRate,
      this.minutesPlayed,
      this.playersOutlived,
      this.lastModified});

  Ltm.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    scorePerMin = json['scorePerMin'];
    scorePerMatch = json['scorePerMatch'];
    wins = json['wins'];
    kills = json['kills'];
    killsPerMin = json['killsPerMin'];
    killsPerMatch = json['killsPerMatch'];
    deaths = json['deaths'];
    kd = json['kd'];
    matches = json['matches'];
    winRate = json['winRate'];
    minutesPlayed = json['minutesPlayed'];
    playersOutlived = json['playersOutlived'];
    lastModified = json['lastModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['scorePerMin'] = this.scorePerMin;
    data['scorePerMatch'] = this.scorePerMatch;
    data['wins'] = this.wins;
    data['kills'] = this.kills;
    data['killsPerMin'] = this.killsPerMin;
    data['killsPerMatch'] = this.killsPerMatch;
    data['deaths'] = this.deaths;
    data['kd'] = this.kd;
    data['matches'] = this.matches;
    data['winRate'] = this.winRate;
    data['minutesPlayed'] = this.minutesPlayed;
    data['playersOutlived'] = this.playersOutlived;
    data['lastModified'] = this.lastModified;
    return data;
  }
}

class Squad {
  int score;
  double scorePerMin;
  double scorePerMatch;
  int wins;
  int top3;
  int top6;
  int kills;
  double killsPerMin;
  double killsPerMatch;
  int deaths;
  double kd;
  int matches;
  double winRate;
  int minutesPlayed;
  int playersOutlived;
  String lastModified;

  Squad(
      {this.score,
      this.scorePerMin,
      this.scorePerMatch,
      this.wins,
      this.top3,
      this.top6,
      this.kills,
      this.killsPerMin,
      this.killsPerMatch,
      this.deaths,
      this.kd,
      this.matches,
      this.winRate,
      this.minutesPlayed,
      this.playersOutlived,
      this.lastModified});

  Squad.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    scorePerMin = json['scorePerMin'];
    scorePerMatch = json['scorePerMatch'];
    wins = json['wins'];
    top3 = json['top3'];
    top6 = json['top6'];
    kills = json['kills'];
    killsPerMin = json['killsPerMin'];
    killsPerMatch = json['killsPerMatch'];
    deaths = json['deaths'];
    kd = json['kd'];
    matches = json['matches'];
    winRate = json['winRate'];
    minutesPlayed = json['minutesPlayed'];
    playersOutlived = json['playersOutlived'];
    lastModified = json['lastModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['scorePerMin'] = this.scorePerMin;
    data['scorePerMatch'] = this.scorePerMatch;
    data['wins'] = this.wins;
    data['top3'] = this.top3;
    data['top6'] = this.top6;
    data['kills'] = this.kills;
    data['killsPerMin'] = this.killsPerMin;
    data['killsPerMatch'] = this.killsPerMatch;
    data['deaths'] = this.deaths;
    data['kd'] = this.kd;
    data['matches'] = this.matches;
    data['winRate'] = this.winRate;
    data['minutesPlayed'] = this.minutesPlayed;
    data['playersOutlived'] = this.playersOutlived;
    data['lastModified'] = this.lastModified;
    return data;
  }
}
