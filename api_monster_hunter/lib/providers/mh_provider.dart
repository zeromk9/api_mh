import 'package:api_monster_hunter/models/mh_fought.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_monster_hunter/models/data.dart';
import 'package:api_monster_hunter/models/now_playing_response.dart';

class MhProvider extends ChangeNotifier {
  List<Ailment> onDisplayMh = [];
  List<Ailment> foughtMh = [];

  MhProvider() {
    getOnDisplayMh();
    getFoughtMh();
  }

  getOnDisplayMh() async {
    try {
      var url = Uri.https('mhw-db.com', '/monsters');
      final response = await http.get(url);
      final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
      onDisplayMh = nowPlayingResponse.ailments;
      notifyListeners();
    } catch (error) {
      // Manejar el error aquí (por ejemplo, mostrar un mensaje de error al usuario)
      //print('Error en getOnDisplayMh: $error');
    }
  }

  getFoughtMh() async {
    try {
      var url = Uri.https('mhw-db.com', '/monsters');
      final response = await http.get(url);
      final popularResponse = FoughtMh.fromRawJson(response.body);
      foughtMh = [...foughtMh, ...popularResponse.data];
      notifyListeners();
    } catch (error) {
      // Manejar el error aquí (por ejemplo, mostrar un mensaje de error al usuario)
      //print('Error en getFoughtMh: $error');
    }
  }
}
