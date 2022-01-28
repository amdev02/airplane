class RumahModel {
  // ignore: non_constant_identifier_names
  final String id_rumah;
  // ignore: non_constant_identifier_names
  final String no_rumah;
  // ignore: non_constant_identifier_names
  final String tipe_rumah;

  RumahModel({
    // ignore: non_constant_identifier_names
    required this.id_rumah,
    // ignore: non_constant_identifier_names
    required this.no_rumah,
    // ignore: non_constant_identifier_names
    required this.tipe_rumah,
  });

  factory RumahModel.fromJson(Map json) {
    return RumahModel(
        id_rumah: json['id_rumah'],
        no_rumah: json['no_rumah'],
        tipe_rumah: json['tipe_rumah']);
  }
}
