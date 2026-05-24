class MyHistoryModel {
  bool success;
  String message;
  MyHistoryModelData data;

  MyHistoryModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MyHistoryModel.fromJson(Map<String, dynamic> json) => MyHistoryModel(
    success: json["success"],
    message: json["message"],
    data: MyHistoryModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class MyHistoryModelData {
  Summary summary;
  Grouped grouped;
  DataData data;

  MyHistoryModelData({
    required this.summary,
    required this.grouped,
    required this.data,
  });

  factory MyHistoryModelData.fromJson(Map<String, dynamic> json) => MyHistoryModelData(
    summary: Summary.fromJson(json["summary"]),
    grouped: Grouped.fromJson(json["grouped"]),
    data: DataData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary.toJson(),
    "grouped": grouped.toJson(),
    "data": data.toJson(),
  };
}

class DataData {
  List<Datum> data;
  Meta meta;

  DataData({
    required this.data,
    required this.meta,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Datum {
  String id;
  String status;
  dynamic note;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  Meeting meeting;
  bool isAutoResolved;

  Datum({
    required this.id,
    required this.status,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.meeting,
    required this.isAutoResolved,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    status: json["status"],
    note: json["note"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    user: User.fromJson(json["user"]),
    meeting: Meeting.fromJson(json["meeting"]),
    isAutoResolved: json["isAutoResolved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "note": note,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "user": user.toJson(),
    "meeting": meeting.toJson(),
    "isAutoResolved": isAutoResolved,
  };
}

class Meeting {
  String id;
  String title;
  String description;
  String location;
  DateTime startTime;
  DateTime endTime;
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
    startTime: DateTime.parse(json["startTime"]),
    endTime: DateTime.parse(json["endTime"]),
    status: json["status"],
    admin: Admin.fromJson(json["admin"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "location": location,
    "startTime": startTime.toIso8601String(),
    "endTime": endTime.toIso8601String(),
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

class User {
  String id;
  String name;
  String email;
  dynamic avatar;
  String department;
  String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.department,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
    department: json["department"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "avatar": avatar,
    "department": department,
    "phone": phone,
  };
}

class Meta {
  int page;
  int limit;
  int total;
  int totalPages;

  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPages": totalPages,
  };
}

class Grouped {
  List<Datum> may2026;

  Grouped({
    required this.may2026,
  });

  factory Grouped.fromJson(Map<String, dynamic> json) => Grouped(
    may2026: List<Datum>.from(json["May 2026"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "May 2026": List<dynamic>.from(may2026.map((x) => x.toJson())),
  };
}

class Summary {
  int total;
  int presence;
  int absence;
  int inMeeting;
  int pending;

  Summary({
    required this.total,
    required this.presence,
    required this.absence,
    required this.inMeeting,
    required this.pending,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    total: json["total"],
    presence: json["presence"],
    absence: json["absence"],
    inMeeting: json["inMeeting"],
    pending: json["pending"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "presence": presence,
    "absence": absence,
    "inMeeting": inMeeting,
    "pending": pending,
  };
}
