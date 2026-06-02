class DocumentsModel {
  bool success;
  String message;
  Data data;

  DocumentsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DocumentsModel.fromJson(Map<String, dynamic> json) => DocumentsModel(
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
  List<Datum> data;
  Meta meta;

  Data({
    required this.data,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
  String fileName;
  String fileUrl;
  int fileSize;
  String fileType;
  String createdAt;
  String updatedAt;
  Uploader? uploader;

  Datum({
    required this.id,
    required this.fileName,
    required this.fileUrl,
    required this.fileSize,
    required this.fileType,
    required this.createdAt,
    required this.updatedAt,
    required this.uploader,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    fileName: json["fileName"],
    fileUrl: json["fileUrl"],
    fileSize: json["fileSize"],
    fileType: json["fileType"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    uploader: Uploader.fromJson(json["uploader"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fileName": fileName,
    "fileUrl": fileUrl,
    "fileSize": fileSize,
    "fileType": fileType,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class Uploader {
  String id;
  String name;
  String email;
  dynamic avatar;

  Uploader({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory Uploader.fromJson(Map<String, dynamic> json) => Uploader(
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
