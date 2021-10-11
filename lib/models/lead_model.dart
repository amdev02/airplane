class LeadModel {
  final String id_lead;
  final String nama_lengkap;
  final String no_wa;
  final String alamat;
  final String status;
  final String keterangan;
  final String tgl_add;
  final String waktu;
  final String hari;
  final String sumber;
  final String id_sales;
  final String id_markom;
  final String jenis_pembayaran;
  final String? id_rumah;

  LeadModel({
    required this.id_lead,
    required this.nama_lengkap,
    required this.no_wa,
    required this.alamat,
    required this.status,
    required this.keterangan,
    required this.tgl_add,
    required this.waktu,
    required this.hari,
    required this.sumber,
    required this.id_sales,
    required this.id_markom,
    required this.jenis_pembayaran,
    this.id_rumah,
  });

  factory LeadModel.fromJson(Map json) {
    return LeadModel(
        id_lead: json['id_lead'],
        nama_lengkap: json['nama_lengkap'],
        no_wa: json['no_wa'],
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
        id_rumah: json['id_rumah']);
  }
}
