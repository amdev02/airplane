class InsightHari {
  final String hari;
  // ignore: non_constant_identifier_names
  final String jumlah_harian;

  InsightHari({
    required this.hari,
    // ignore: non_constant_identifier_names
    required this.jumlah_harian,
  });

  factory InsightHari.fromJson(Map json) {
    return InsightHari(
        hari: json['hari'], jumlah_harian: json['jumlah_harian']);
  }
}

class InsightMinggu {
  final String minggu;
  // ignore: non_constant_identifier_names
  final String jumlah_mingguan;

  InsightMinggu({
    required this.minggu,
    // ignore: non_constant_identifier_names
    required this.jumlah_mingguan,
  });

  factory InsightMinggu.fromJson(Map json) {
    return InsightMinggu(
        minggu: json['minggu'], jumlah_mingguan: json['jumlah_mingguan']);
  }
}

class InsightBulan {
  final String bulan;
  // ignore: non_constant_identifier_names
  final String jumlah_bulanan;

  InsightBulan({
    required this.bulan,
    // ignore: non_constant_identifier_names
    required this.jumlah_bulanan,
  });

  factory InsightBulan.fromJson(Map json) {
    return InsightBulan(
        bulan: json['bulan'], jumlah_bulanan: json['jumlah_bulanan']);
  }
}

class InsightHarianUser {
  final String hari;
  // ignore: non_constant_identifier_names
  final String nama_user;
  // ignore: non_constant_identifier_names
  final String jumlah_harian;

  InsightHarianUser({
    required this.hari,
    // ignore: non_constant_identifier_names
    required this.nama_user,
    // ignore: non_constant_identifier_names
    required this.jumlah_harian,
  });

  factory InsightHarianUser.fromJson(Map json) {
    return InsightHarianUser(
        hari: json['hari'],
        nama_user: json['nama_user'],
        jumlah_harian: json['jumlah_harian']);
  }
}

class InsightMingguanUser {
  final String minggu;
  // ignore: non_constant_identifier_names
  final String nama_user;
  // ignore: non_constant_identifier_names
  final String jumlah_mingguan;

  InsightMingguanUser({
    required this.minggu,
    // ignore: non_constant_identifier_names
    required this.nama_user,
    // ignore: non_constant_identifier_names
    required this.jumlah_mingguan,
  });

  factory InsightMingguanUser.fromJson(Map json) {
    return InsightMingguanUser(
        minggu: json['minggu'],
        nama_user: json['nama_user'],
        jumlah_mingguan: json['jumlah_mingguan']);
  }
}

class InsightBulananUser {
  final String bulan;
  // ignore: non_constant_identifier_names
  final String nama_user;
  // ignore: non_constant_identifier_names
  final String jumlah_bulanan;

  InsightBulananUser({
    required this.bulan,
    // ignore: non_constant_identifier_names
    required this.nama_user,
    // ignore: non_constant_identifier_names
    required this.jumlah_bulanan,
  });

  factory InsightBulananUser.fromJson(Map json) {
    return InsightBulananUser(
        bulan: json['bulan'],
        nama_user: json['nama_user'],
        jumlah_bulanan: json['jumlah_bulanan']);
  }
}
