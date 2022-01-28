class Sold3Model {
  // ignore: non_constant_identifier_names
  final String? id_rumah;
  // ignore: non_constant_identifier_names
  final String? id_lead;
  // ignore: non_constant_identifier_names
  final String? no_rumah;
  // ignore: non_constant_identifier_names
  final String? tipe_rumah;
  final String? harga;
  // ignore: non_constant_identifier_names
  final String? status_rumah;
  // ignore: non_constant_identifier_names
  final String? nama_lengkap;
  // ignore: non_constant_identifier_names
  final String? jenis_pembayaran;

  Sold3Model({
    // ignore: non_constant_identifier_names
    this.id_rumah,
    // ignore: non_constant_identifier_names
    this.id_lead,
    // ignore: non_constant_identifier_names
    this.no_rumah,
    // ignore: non_constant_identifier_names
    this.tipe_rumah,
    this.harga,
    // ignore: non_constant_identifier_names
    this.status_rumah,
    // ignore: non_constant_identifier_names
    this.nama_lengkap,
    // ignore: non_constant_identifier_names
    this.jenis_pembayaran,
  });

  factory Sold3Model.fromJson(Map json) {
    return Sold3Model(
      id_rumah: json['id_rumah'],
      id_lead: json['id_lead'],
      no_rumah: json['no_rumah'],
      tipe_rumah: json['tipe_rumah'],
      harga: json['harga'],
      status_rumah: json['status_rumah'],
      nama_lengkap: json['nama_lengkap'],
      jenis_pembayaran: json['jenis_pembayaran'],
    );
  }
}
