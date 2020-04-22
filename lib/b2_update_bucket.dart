import 'package:http/http.dart' as http;
import 'dart:convert';

class B2UpdateBucket {
  // Data from auth
  String apiUrl;
  String accountId;
  String authorizationToken;
  String bucketId;
  String bucketType; // Either allPublic or allPrivate
  String bucketInfo;
  List corsRules;
  Map lifecycleRules;
  Map data;

  // Data from request
  List buckets; // List of buckets

  B2UpdateBucket(
      {this.apiUrl, this.accountId, this.authorizationToken, this.bucketId});

  // TODO: Possible apiUrl cleanup
  // TODO: Implement CORS, LifecycleRules and everything
  Future<void> updateBucket() async {
    var headers = {'Authorization': authorizationToken};
    var response = await http.get(
      '$apiUrl/b2api/v2/b2_update_bucket?accountId=$accountId&bucketId=$bucketId',
      headers: headers,
    );
    data = jsonDecode(response.body);
  }
}
