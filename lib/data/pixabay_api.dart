import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:image_search/data/photo_api_repository.dart';
import '../model/photo.dart';

class PixabayApi extends PhotoApiRepository {
  final baseUrl = 'https://pixabay.com/api';
  final key = '29652629-7953ddc2e0dd24fe152bb732e';

  @override
  Future<List<Photo>> fetch(String query) async {
    final response = await http
        .get(Uri.parse('$baseUrl/?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
