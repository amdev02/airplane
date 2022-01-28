class AntrianModel {
  final int? no;
  // ignore: non_constant_identifier_names
  final String? id_users;
  // ignore: non_constant_identifier_names
  final String? name_user;
  final String? updateDate;

  AntrianModel({
    this.no,
    // ignore: non_constant_identifier_names
    this.id_users,
    // ignore: non_constant_identifier_names
    this.name_user,
    this.updateDate,
  });

  factory AntrianModel.fromJson(Map json) {
    return AntrianModel(
        no: json['no'],
        id_users: json['id_user'],
        name_user: json['nama_user'],
        updateDate: json['updateDate']);
  }
}
