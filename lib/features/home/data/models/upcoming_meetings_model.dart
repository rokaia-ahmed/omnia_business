class UpcomingMeetingsModel {
  bool success;
  String message;
  Data data;

  UpcomingMeetingsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpcomingMeetingsModel.fromJson(Map<String, dynamic> json) => UpcomingMeetingsModel(
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
  List<Meeting> data;
  Meta meta;

  Data({
    required this.data,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Meeting>.from(json["data"].map((x) => Meeting.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
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
  Supervisor supervisor;
  String myAttendanceStatus;
  dynamic myAttendanceNote;
  List<Supervisor> employees;
  int totalEmployees;

  Meeting({
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
    required this.employees,
    required this.totalEmployees,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    location: json["location"],
    startTime: DateTime.parse(json["startTime"]),
    endTime: DateTime.parse(json["endTime"]),
    status: json["status"],
    supervisor: Supervisor.fromJson(json["supervisor"]),
    myAttendanceStatus: json["myAttendanceStatus"],
    myAttendanceNote: json["myAttendanceNote"],
    employees: List<Supervisor>.from(json["employees"].map((x) => Supervisor.fromJson(x))),
    totalEmployees: json["totalEmployees"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "location": location,
    "startTime": startTime.toIso8601String(),
    "endTime": endTime.toIso8601String(),
    "status": status,
    "supervisor": supervisor.toJson(),
    "myAttendanceStatus": myAttendanceStatus,
    "myAttendanceNote": myAttendanceNote,
    "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
    "totalEmployees": totalEmployees,
  };
}

class Supervisor {
  String id;
  String name;
  dynamic avatar;
  String email;
  String? attendanceStatus;

  Supervisor({
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
    this.attendanceStatus,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) => Supervisor(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
    email: json["email"],
    attendanceStatus: json["attendanceStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
    "email": email,
    "attendanceStatus": attendanceStatus,
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
