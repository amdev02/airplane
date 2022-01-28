class TamuModel {
  // ignore: non_constant_identifier_names
  final String id_list_tamu;
  // ignore: non_constant_identifier_names
  final String id_sales;
  // ignore: non_constant_identifier_names
  final String nama_tamu;
  // ignore: non_constant_identifier_names
  final String no_telepon;
  final String created;
  // ignore: non_constant_identifier_names
  final String tgl_visit;
  final String keterangan;
  // ignore: non_constant_identifier_names
  final String id_markom;
  // ignore: non_constant_identifier_names
  final String nama_sales;

  TamuModel({
    // ignore: non_constant_identifier_names
    required this.id_list_tamu,
    // ignore: non_constant_identifier_names
    required this.id_sales,
    // ignore: non_constant_identifier_names
    required this.nama_tamu,
    // ignore: non_constant_identifier_names
    required this.no_telepon,
    required this.created,
    // ignore: non_constant_identifier_names
    required this.tgl_visit,
    required this.keterangan,
    // ignore: non_constant_identifier_names
    required this.id_markom,
    // ignore: non_constant_identifier_names
    required this.nama_sales,
  });

  factory TamuModel.fromJson(Map json) {
    return TamuModel(
      id_list_tamu: json['id_list_tamu'],
      id_sales: json['id_sales'],
      nama_tamu: json['nama_tamu'],
      no_telepon: json['no_telepon'],
      created: json['created'],
      tgl_visit: json['tgl_visit'],
      keterangan: json['keterangan'],
      id_markom: json['keterangan'],
      nama_sales: json['nama_sales'],
    );
  }
}
