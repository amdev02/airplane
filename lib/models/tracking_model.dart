class TrackingModel {
  // ignore: non_constant_identifier_names
  final String id_tracking;
  // ignore: non_constant_identifier_names
  final String id_user;
  // ignore: non_constant_identifier_names
  final String id_lead;
  final String keterangan;
  final String tgl;
  // ignore: non_constant_identifier_names
  final String nama_user;

  TrackingModel({
    // ignore: non_constant_identifier_names
    required this.id_tracking,
    // ignore: non_constant_identifier_names
    required this.id_user,
    // ignore: non_constant_identifier_names
    required this.id_lead,
    required this.keterangan,
    required this.tgl,
    // ignore: non_constant_identifier_names
    required this.nama_user,
  });

  factory TrackingModel.fromJson(Map json) {
    return TrackingModel(
      id_tracking: json['id_tracking'],
      id_user: json['id_user'],
      id_lead: json['id_lead'],
      keterangan: json['keterangan'],
      tgl: json['tgl'],
      nama_user: json['nama_user'],
    );
  }
}
