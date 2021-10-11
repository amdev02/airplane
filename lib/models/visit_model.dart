class VisitModel {
  final String id_visit;
  final String id_lead;
  final String nama_lengkap;
  final String no_wa;
  final String alamat;
  final String sumber;
  final String keterangan;
  final String status_visit;
  final String id_sales;
  final String id_markom;
  final String tgl;
  final String tgl_visit;

  VisitModel({
    required this.id_visit,
    required this.id_lead,
    required this.nama_lengkap,
    required this.no_wa,
    required this.alamat,
    required this.sumber,
    required this.keterangan,
    required this.status_visit,
    required this.id_sales,
    required this.id_markom,
    required this.tgl,
    required this.tgl_visit,
  });

  factory VisitModel.fromJson(Map json) {
    return VisitModel(
        id_visit: json['id_visit'],
        id_lead: json['id_lead'],
        nama_lengkap: json['nama_lengkap'],
        no_wa: json['no_wa'],
        alamat: json['alamat'],
        sumber: json['sumber'],
        keterangan: json['keterangan'],
        status_visit: json['status_visit'],
        id_sales: json['id_sales'],
        id_markom: json['id_markom'],
        tgl: json['tgl'],
        tgl_visit: json['tgl_visit']);
  }
}
