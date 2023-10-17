import 'dart:convert';
import 'package:api_monster_hunter/models/data.dart';

class FoughtMh {
  int page;
  List<Ailment> data;
  int totalPages;
  int totalResults;

  FoughtMh({
    required this.page,
    required this.data,
    required this.totalPages,
    required this.totalResults,
  });

  factory FoughtMh.fromRawJson(String str) =>
      FoughtMh.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory FoughtMh.fromJson(Map<String, dynamic> json) => FoughtMh(
        page: json["page"],
        data:
            List<Ailment>.from(json["results"].map((x) => Ailment.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
