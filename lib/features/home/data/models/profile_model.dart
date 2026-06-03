class ProfileModel {
  bool success;
  String message;
  Data data;

  ProfileModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
  String id;
  String name;
  String email;
  String role;
  dynamic avatar;
  String phone;
  String department;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int scheduledMeetingsCount;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.avatar,
    required this.phone,
    required this.department,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.scheduledMeetingsCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    avatar: json["avatar"],
    phone: json["phone"],
    department: json["department"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    scheduledMeetingsCount: json["scheduledMeetingsCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "role": role,
    "avatar": avatar,
    "phone": phone,
    "department": department,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "scheduledMeetingsCount": scheduledMeetingsCount,
  };
}
