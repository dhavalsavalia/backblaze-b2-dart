import 'package:http_auth/http_auth.dart';
import 'dart:convert';

class B2AuthorizeAccount {
  String url = 'https://api.backblazeb2.com/b2api/v2/b2_authorize_account';
  String applicationKeyId;
  String applicationKey;
  Map data;

  B2AuthorizeAccount({this.applicationKeyId, this.applicationKey});

  Future<void> authorizeAccount() async {
    var credentials = BasicAuthClient(applicationKeyId, applicationKey);
    await credentials.get(url).then(
      (r) {
        data = jsonDecode(r.body);
      },
    );
  }
}
