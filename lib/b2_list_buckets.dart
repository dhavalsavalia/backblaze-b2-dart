import 'package:http/http.dart' as http;
import 'dart:convert';

class B2ListBuckets {
  // Data from auth
  String apiUrl;
  String accountId;
  String authorizationToken;

  // Data from request
  List buckets; // List of buckets

  B2ListBuckets({this.apiUrl, this.accountId, this.authorizationToken});

  Future<void> listBuckets() async {
    var headers = {'Authorization': authorizationToken};
    var response = await http.get(
      '$apiUrl/b2api/v2/b2_list_buckets?accountId=$accountId',
      headers: headers,
    );
    var data = jsonDecode(response.body);
    buckets = data['buckets'];
  }
}
