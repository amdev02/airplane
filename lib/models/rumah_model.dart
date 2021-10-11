class RumahModel {
  final String id_rumah;
  final String no_rumah;
  final String tipe_rumah;

  RumahModel({
    required this.id_rumah,
    required this.no_rumah,
    required this.tipe_rumah,
  });

  factory RumahModel.fromJson(Map json) {
    return RumahModel(
        id_rumah: json['id_rumah'],
        no_rumah: json['no_rumah'],
        tipe_rumah: json['tipe_rumah']);
  }
}
