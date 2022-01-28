class LeadModel {
  // ignore: non_constant_identifier_names
  final String id_lead;
  // ignore: non_constant_identifier_names
  final String nama_lengkap;
  // ignore: non_constant_identifier_names
  final String no_wa;
  final String alamat;
  final String status;
  final String keterangan;
  // ignore: non_constant_identifier_names
  final String tgl_add;
  final String waktu;
  final String hari;
  final String sumber;
  // ignore: non_constant_identifier_names
  final String id_sales;
  // ignore: non_constant_identifier_names
  final String id_markom;
  // ignore: non_constant_identifier_names
  final String jenis_pembayaran;
  // ignore: non_constant_identifier_names
  final String? id_rumah;
  // ignore: non_constant_identifier_names
  final String? nama_markom;
  // ignore: non_constant_identifier_names
  final String? images_markom;
  // ignore: non_constant_identifier_names
  final String? no_rumah;
  // ignore: non_constant_identifier_names
  final String? tipe_rumah;
  final String? harga;

  LeadModel({
    // ignore: non_constant_identifier_names
    required this.id_lead,
    // ignore: non_constant_identifier_names
    required this.nama_lengkap,
    // ignore: non_constant_identifier_names
    required this.no_wa,
    required this.alamat,
    required this.status,
    required this.keterangan,
    // ignore: non_constant_identifier_names
    required this.tgl_add,
    required this.waktu,
    required this.hari,
    required this.sumber,
    // ignore: non_constant_identifier_names
    required this.id_sales,
    // ignore: non_constant_identifier_names
    required this.id_markom,
    // ignore: non_constant_identifier_names
    required this.jenis_pembayaran,
    // ignore: non_constant_identifier_names
    this.id_rumah,
    // ignore: non_constant_identifier_names
    this.nama_markom,
    // ignore: non_constant_identifier_names
    this.images_markom,
    // ignore: non_constant_identifier_names
    this.no_rumah,
    // ignore: non_constant_identifier_names
    this.tipe_rumah,
    this.harga,
  });

  factory LeadModel.fromJson(Map json) {
    return LeadModel(
      id_lead: json['id_lead'],
      nama_lengkap: json['nama_lengkap'],
      no_wa: json['no_whatsapp'],
      alamat: json['alamat'],
      status: json['status'],
      keterangan: json['keterangan'],
      tgl_add: json['tgl_add'],
      waktu: json['waktu'],
      hari: json['hari'],
      sumber: json['sumber'],
      id_sales: json['id_sales'],
      id_markom: json['id_markom'],
      jenis_pembayaran: json['jenis_pembayaran'],
      id_rumah: json['id_rumah'],
      nama_markom: json['nama_markom'],
      images_markom: json['images_markom'],
      no_rumah: json['no_rumah'],
      tipe_rumah: json['tipe_rumah'],
      harga: json['harga'],
    );
  }
}
