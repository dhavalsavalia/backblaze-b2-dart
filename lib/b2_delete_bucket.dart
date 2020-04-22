import 'package:http/http.dart' as http;
import 'dart:convert';

class B2DeleteBucket {
  // Data from auth
  String apiUrl;
  String accountId;
  String authorizationToken;
  String bucketId;

  Map data;

  B2DeleteBucket(
      {this.apiUrl, this.accountId, this.authorizationToken, this.bucketId});

  Future<void> deleteBucket() async {
    var headers = {'Authorization': authorizationToken};
    var response = await http.get(
      '$apiUrl/b2api/v2/b2_delete_bucket?accountId=$accountId&bucketId=$bucketId',
      headers: headers,
    );
    data = jsonDecode(response.body);
  }
}
