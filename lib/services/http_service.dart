import 'dart:convert';
import 'dart:developer';

import 'package:super_hero_app/models/super_hero.dart';
import 'package:http/http.dart';

class HttpService {
  static String url = "https://akabab.github.io/superhero-api/api/all.json";

  static Future<List<Superhero>?> fetchSuperHero() async {
    Uri uri = Uri.parse(url);
    try {
      Response response = await get(uri);
      List<dynamic> body = jsonDecode(response.body);
      List<Superhero> superHeros =
          body.map((e) => Superhero.fromJson(e)).toList();
      return superHeros;
    } catch (e) {
      log(e.toString());
      throw ("An Exception occured: $e"); 
    }
  }
}
