class HistoryModel {
  bool success;
  String message;
  Data data;

  HistoryModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  List<History> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<History>.from(json["data"].map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class History {
  String id;
  String status;
  dynamic note;
  String createdAt;
  String updatedAt;
  Meeting meeting;
  bool isAutoResolved;

  History({
    required this.id,
    required this.status,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.meeting,
    required this.isAutoResolved,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    id: json["id"],
    status: json["status"],
    note: json["note"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    meeting: Meeting.fromJson(json["meeting"]),
    isAutoResolved: json["isAutoResolved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "note": note,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "meeting": meeting.toJson(),
    "isAutoResolved": isAutoResolved,
  };
}

class Meeting {
  String id;
  String title;
  String description;
  String location;
  String startTime;
  String endTime;
  String status;
  Admin admin;

  Meeting({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.admin,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    location: json["location"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    status: json["status"],
    admin: Admin.fromJson(json["admin"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "location": location,
    "startTime": startTime,
    "endTime": endTime,
    "status": status,
    "admin": admin.toJson(),
  };
}

class Admin {
  String id;
  String name;
  String email;
  dynamic avatar;

  Admin({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "avatar": avatar,
  };
}




