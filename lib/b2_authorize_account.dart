import 'package:http_auth/http_auth.dart';
import 'dart:convert';

class B2AuthorizeAccount {
  String url = 'https://api.backblazeb2.com/b2api/v2/b2_authorize_account';
  String applicationKeyId;
  String applicationKey;
  Map response;

  // Auth Response
  String accountId;
  String authorizationToken;
  String apiUrl;
  String downloadUrl;

  B2AuthorizeAccount({this.applicationKeyId, this.applicationKey});

  Future<void> authorizeAccount() async {
    var credentials = BasicAuthClient(applicationKeyId, applicationKey);
    await credentials.get(url).then(
      (r) {
        response = jsonDecode(r.body);
        accountId = response['accountId'];
        authorizationToken = response['authorizationToken'];
        apiUrl = response['apiUrl'];
        downloadUrl = response['downloadUrl'];
      },
    );
  }
}
