import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:varana_apps/models/tamu_model.dart';

class SpvEditListTamu extends StatefulWidget {
  final TamuModel model;
  SpvEditListTamu(this.model);
  @override
  _SpvEditListTamuState createState() => _SpvEditListTamuState();
}

class _SpvEditListTamuState extends State<SpvEditListTamu> {
  var salesSelection;
  var isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  setup() async {
    nameController = TextEditingController(text: widget.model.nama_tamu);
    noController = TextEditingController(text: widget.model.no_telepon);
    keteranganController = TextEditingController(text: widget.model.keterangan);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
