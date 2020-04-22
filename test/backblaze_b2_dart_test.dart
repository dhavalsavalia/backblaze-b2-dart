import 'package:backblaze_b2_dart/b2_authorize_account.dart';
import 'package:backblaze_b2_dart/b2_list_buckets.dart';
import 'package:test/test.dart';

void main() {
  // TODO: Make use of command-line arguments for tests
  var applicationKeyId = ''; // Your Application Key ID
  var applicationKey = ''; // Your Application Key
  var accountId = ''; // Your Account ID
  var authData; // Auth data for other tests
  int numberOfBuckets; // Your number of buckets
  test('b2_authorize_account implementation', () async {
    var auth = B2AuthorizeAccount(
        applicationKeyId: applicationKeyId, applicationKey: applicationKey);
    authData = auth;
    await auth.authorizeAccount();
    expect(auth.accountId, equals(accountId));
  });

  group('Bucket Tests', () {
    test('b2_list_buckets implementation', () async {
      var list_buckets = B2ListBuckets(
          apiUrl: authData.apiUrl,
          accountId: authData.accountId,
          authorizationToken: authData.authorizationToken);
      await list_buckets.listBuckets();
      expect(list_buckets.buckets.length, equals(numberOfBuckets));
    });
  });
}
