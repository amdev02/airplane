class AbsenModel {
  // ignore: non_constant_identifier_names
  final String? id_absen;
  final String imagesAbsen;
  final String date;
  final String status;
  final String keterangan;
  // ignore: non_constant_identifier_names
  final String? id_user;
  // ignore: non_constant_identifier_names
  final String nama_user;
  final String image;

  AbsenModel(
      // ignore: non_constant_identifier_names
      {this.id_absen,
      // ignore: non_constant_identifier_names
      this.id_user,
      required this.imagesAbsen,
      required this.date,
      required this.status,
      required this.keterangan,
      // ignore: non_constant_identifier_names
      required this.nama_user,
      required this.image});

  factory AbsenModel.fromJson(Map json) {
    return AbsenModel(
      id_absen: json['id_absen'],
      imagesAbsen: json['image_absen'],
      date: json['tgl_absen'],
      status: json['status'],
      keterangan: json['keterangan'],
      id_user: json['id_user'],
      nama_user: json['nama_user'],
      image: json['image'],
    );
  }
}
