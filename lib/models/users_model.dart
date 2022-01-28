class UsersModel {
  // ignore: non_constant_identifier_names
  final String id_users;
  final String username;
  // ignore: non_constant_identifier_names
  final String nama_user;
  final String level;
  final String active;
  final String createDate;
  final String updateDate;
  final String id;
  final String image;
  final String token;

  UsersModel({
    // ignore: non_constant_identifier_names
    required this.id_users,
    required this.username,
    // ignore: non_constant_identifier_names
    required this.nama_user,
    required this.level,
    required this.active,
    required this.createDate,
    required this.updateDate,
    required this.id,
    required this.image,
    required this.token,
  });

  factory UsersModel.fromJson(Map json) {
    return UsersModel(
        id_users: json['id_user'],
        username: json['username'],
        nama_user: json['nama_user'],
        level: json['level'],
        active: json['active'],
        createDate: json['created'],
        updateDate: json['updateDate'],
        id: json['id_markom'],
        image: json['images'],
        token: json['token']);
  }
}

class UserModelInsight {
  // ignore: non_constant_identifier_names
  final String? id_users;
  // ignore: non_constant_identifier_names
  final String? nama_user;
  final String? level;

  // ignore: non_constant_identifier_names
  UserModelInsight({this.id_users, this.nama_user, this.level});

  factory UserModelInsight.fromJson(Map json) {
    return UserModelInsight(
      id_users: json['id_user'],
      nama_user: json['nama_user'],
      level: json['level'],
    );
  }
}
