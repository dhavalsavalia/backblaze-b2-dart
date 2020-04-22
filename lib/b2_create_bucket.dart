import 'package:http/http.dart' as http;
import 'dart:convert';

class B2CreateBucket {
  // Data from auth
  String apiUrl;
  String accountId;
  String authorizationToken;
  String bucketName;
  String bucketType; // Either allPublic or allPrivate | Defalut = allPrivate
  Map data;

  // Data from request
  List buckets; // List of buckets

  B2CreateBucket(
      {this.apiUrl,
      this.accountId,
      this.authorizationToken,
      this.bucketName,
      this.bucketType = 'allPrivate'});

  // TODO: Possible apiUrl cleanup
  Future<void> createBucket() async {
    var headers = {'Authorization': authorizationToken};
    var response = await http.get(
      '$apiUrl/b2api/v2/b2_create_bucket?accountId=$accountId&bucketName=$bucketName&bucketType=$bucketType',
      headers: headers,
    );
    data = jsonDecode(response.body);
  }
}
