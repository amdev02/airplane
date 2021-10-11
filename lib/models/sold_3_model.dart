class Sold3Model {
  final String? id_rumah;
  final String? id_lead;
  final String? no_rumah;
  final String? tipe_rumah;
  final String? harga;
  final String? status_rumah;
  final String? nama_lengkap;
  final String? jenis_pembayaran;

  Sold3Model(
      {this.id_rumah,
      this.id_lead,
      this.no_rumah,
      this.tipe_rumah,
      this.harga,
      this.status_rumah,
      this.nama_lengkap,
      this.jenis_pembayaran});

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
