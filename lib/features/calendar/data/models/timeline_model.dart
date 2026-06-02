class TimelineModel {
  bool success;
  String message;
  Data data;

  TimelineModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) => TimelineModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}

class Data {
  String date;
  List<Timeline> timeline;

  Data({
    required this.date,
    required this.timeline,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    date: json["date"],
    timeline: List<Timeline>.from(json["timeline"].map((x) => Timeline.fromJson(x))),
  );

}

class Timeline {
  String id;
  String title;
  String description;
  String location;
  String startTime;
  String endTime;
  String status;
  Supervisor supervisor;
  String myAttendanceStatus;
  dynamic myAttendanceNote;

  Timeline({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.supervisor,
    required this.myAttendanceStatus,
    required this.myAttendanceNote,
  });

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    location: json["location"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    status: json["status"],
    supervisor: Supervisor.fromJson(json["supervisor"]),
    myAttendanceStatus: json["myAttendanceStatus"],
    myAttendanceNote: json["myAttendanceNote"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "location": location,
    "startTime": startTime,
    "endTime": endTime,
    "status": status,
    "supervisor": supervisor.toJson(),
    "myAttendanceStatus": myAttendanceStatus,
    "myAttendanceNote": myAttendanceNote,
  };
}

class Supervisor {
  String id;
  String name;
  String email;
  dynamic avatar;

  Supervisor({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) => Supervisor(
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
