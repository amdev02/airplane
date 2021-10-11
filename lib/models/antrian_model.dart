class AntrianModel {
  final int? no;
  final String? id_users;
  final String? name_user;
  final String? updateDate;

  AntrianModel({
    this.no,
    this.id_users,
    this.name_user,
    this.updateDate,
  });

  factory AntrianModel.fromJson(Map json) {
    return AntrianModel(
        no: json['no'],
        id_users: json['id_users'],
        name_user: json['name_user'],
        updateDate: json['updateDate']);
  }
}
