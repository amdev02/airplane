class AvailableModels {
  // ignore: non_constant_identifier_names
  final String id_rumah;
  // ignore: non_constant_identifier_names
  final String no_rumah;
  // ignore: non_constant_identifier_names
  final String tipe_rumah;
  final String? harga;
  // ignore: non_constant_identifier_names
  final String status_rumah;

  AvailableModels(
      // ignore: non_constant_identifier_names
      {required this.id_rumah,
      // ignore: non_constant_identifier_names
      required this.no_rumah,
      // ignore: non_constant_identifier_names
      required this.tipe_rumah,
      this.harga,
      // ignore: non_constant_identifier_names
      required this.status_rumah});

  factory AvailableModels.fromJson(Map json) {
    return AvailableModels(
        id_rumah: json['id_rumah'],
        no_rumah: json['no_rumah'],
        tipe_rumah: json['tipe_rumah'],
        harga: json['harga'],
        status_rumah: json['status']);
  }
}

class UnitModel {
  // ignore: non_constant_identifier_names
  final String id_rumah;
  // ignore: non_constant_identifier_names
  final String id_lead;
  // ignore: non_constant_identifier_names
  final String no_rumah;
  // ignore: non_constant_identifier_names
  final String tipe_rumah;
  final String harga;
  // ignore: non_constant_identifier_names
  final String status_rumah;
  // ignore: non_constant_identifier_names
  final String nama_lengkap;
  // ignore: non_constant_identifier_names
  final String jenis_pembayaran;

  UnitModel({
    // ignore: non_constant_identifier_names
    required this.id_rumah,
    // ignore: non_constant_identifier_names
    required this.id_lead,
    // ignore: non_constant_identifier_names
    required this.no_rumah,
    // ignore: non_constant_identifier_names
    required this.tipe_rumah,
    required this.harga,
    // ignore: non_constant_identifier_names
    required this.status_rumah,
    // ignore: non_constant_identifier_names
    required this.nama_lengkap,
    // ignore: non_constant_identifier_names
    required this.jenis_pembayaran,
  });

  factory UnitModel.fromJson(Map json) {
    return UnitModel(
        id_rumah: json['id_rumah'],
        id_lead: json['id_lead'],
        no_rumah: json['no_rumah'],
        tipe_rumah: json['tipe_rumah'],
        harga: json['harga'],
        status_rumah: json['status_rumah'],
        nama_lengkap: json['nama_lengkap'],
        jenis_pembayaran: json['jenis_pembayaran']);
  }
}
