class AbsenModel {
  final String? id_absen;
  final String? id_sales;
  final String? imagesAbsen;
  final String? date;
  final String? date_wi;
  final String? status;
  final String? keterangan;
  final String? id_markom;
  final String? id_users;
  final String? nama_user;
  final String? image;

  AbsenModel(
      {this.id_absen,
      this.id_sales,
      this.imagesAbsen,
      this.date,
      this.date_wi,
      this.status,
      this.keterangan,
      this.id_markom,
      this.id_users,
      this.nama_user,
      this.image});

  factory AbsenModel.fromJson(Map json) {
    return AbsenModel(
      id_absen: json['id_absen'],
      id_sales: json['id_sales'],
      imagesAbsen: json['imagesAbsen'],
      date: json['date'],
      date_wi: json['date_wi'],
      status: json['status'],
      keterangan: json['keterangan'],
      id_markom: json['id_markom'],
      id_users: json['id_users'],
      nama_user: json['nama_user'],
      image: json['image'],
    );
  }
}
