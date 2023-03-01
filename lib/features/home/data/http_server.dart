import 'package:http_request/features/create/data/date_model.dart';
import 'dart:convert';

import 'package:http/http.dart';

class Network {
  static String BASE = "61f2ded52219930017f5094a.mockapi.io";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Apis */

  static String API_LIST = "/api/contacts";
  static String API_CREATE = "/api/contacts";
  static String API_UPDATE = "/api/contacts/"; //{id}
  static String API_DELETE = "/api/contacts/"; //{id}
  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(
      uri,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, body: params);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('response.body: ${response.body}');
      return response.body;
    }
    return "";
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, body: params);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(
      uri,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'mobile': post.mobile!,
      'fullname': post.fullname!,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'mobile': post.mobile!,
      'fullname': post.fullname!,
    });
    return params;
  }

  /*Http Parsing*/

  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }

  static Post parsePost(String response) {
    dynamic json = jsonDecode(response);
    return Post.fromJson(json);
  }
}
