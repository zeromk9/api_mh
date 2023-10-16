import 'package:api_monster_hunter/providers/mh_fought.dart';
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
    var url = Uri.https('mhw-db.com/monsters');
    final response = await http.get(url);
    final nowPLayingResponse = NowPlayingResponse.fromRawJson(response.body);
    onDisplayMh = nowPLayingResponse.ailments;
    notifyListeners();
  }

  getFoughtMh() async {
    var url = Uri.https('mhw-db.com/monsters');
    final response = await http.get(url);
    final popularResponse = FoughtMh.fromRawJson(response.body);
    foughtMh = [...foughtMh, ...popularResponse.data];
    notifyListeners();
  }
}
