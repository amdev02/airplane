class UsersModel {
  final String id_users;
  final String username;
  final String nama_user;
  final String level;
  final String active;
  final String createDate;
  final String updateDate;
  final String id;
  final String image;
  final String token;

  UsersModel({
    required this.id_users,
    required this.username,
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
        id_users: json['id_users'],
        username: json['username'],
        nama_user: json['nama_user'],
        level: json['level'],
        active: json['active'],
        createDate: json['createDate'],
        updateDate: json['updateDate'],
        id: json['id'],
        image: json['image'],
        token: json['token']);
  }
}

class UserModelInsight {
  final String? id_users;
  final String? nama_user;
  final String? level;

  UserModelInsight({this.id_users, this.nama_user, this.level});

  factory UserModelInsight.fromJson(Map json) {
    return UserModelInsight(
      id_users: json['id_users'],
      nama_user: json['nama_user'],
      level: json['level'],
    );
  }
}
