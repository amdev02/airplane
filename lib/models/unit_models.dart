class AvailableModels {
  final String id_rumah;
  final String id_lead;
  final String no_rumah;
  final String tipe_rumah;
  final String harga;
  final String status_rumah;

  AvailableModels(
      {required this.id_rumah,
      required this.id_lead,
      required this.no_rumah,
      required this.tipe_rumah,
      required this.harga,
      required this.status_rumah});

  factory AvailableModels.fromJson(Map json) {
    return AvailableModels(
        id_rumah: json['id_rumah'],
        id_lead: json['id_lead'],
        no_rumah: json['no_rumah'],
        tipe_rumah: json['tipe_rumah'],
        harga: json['harga'],
        status_rumah: json['status_rumah']);
  }
}

class UnitModel {
  final String id_rumah;
  final String id_lead;
  final String no_rumah;
  final String tipe_rumah;
  final String harga;
  final String status_rumah;
  final String nama_lengkap;
  final String jenis_pembayaran;

  UnitModel({
    required this.id_rumah,
    required this.id_lead,
    required this.no_rumah,
    required this.tipe_rumah,
    required this.harga,
    required this.status_rumah,
    required this.nama_lengkap,
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
