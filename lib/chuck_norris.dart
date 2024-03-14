import "dart:convert";
import "package:http/http.dart" as http;

const String stringUrl = "https://api.chucknorris.io/jokes/random";

final url = Uri.parse(stringUrl);

class Cit {
  final String cit;
  final String id;
  final String createdAt;

  Cit({required this.cit, required this.id, required this.createdAt});


  factory Cit.fromJson(String jsonString) {
    Map<String, dynamic> map=json.decode(jsonString);
  return Cit.fromMap(map);
}

  factory Cit.fromMap(Map<String, dynamic> map) {
    return Cit(
      cit: map["value"],
      id: map["id"],
      createdAt: map["created_at"],
    );
  }
}

Future<Cit> getCIT() async {
  final res = await http.get(url);
  final data = json.decode(res.body);

  return Cit(
    cit: data["value"],
    id: data["id"],
    createdAt: data["created_at"],
  );
}

Future<Cit> getCITfromcategory(String category) async {
  final uriWithCategory =url.replace(queryParameters: {'category': category});
  final res = await http.get(uriWithCategory);
  return Cit.fromJson(res.body);
}

Future<List<Cit>> getCITbysearchParam(String searchparam) async {
  final uriWithSearch =
      url.replace(queryParameters: {'query': searchparam});
  final res = await http.get(uriWithSearch);
  final data = json.decode(res.body);

  final list = data['result'] as List;
  final cfs = list.map((e) => Cit.fromMap(e as Map<String, dynamic>)).toList();
  return cfs;
}
