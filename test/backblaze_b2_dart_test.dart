import 'package:backblaze_b2_dart/b2_authorize_account.dart';
import 'package:backblaze_b2_dart/b2_create_bucket.dart';
import 'package:backblaze_b2_dart/b2_list_buckets.dart';
import 'package:backblaze_b2_dart/b2_update_bucket.dart';
import 'package:test/test.dart';

void main() {
  // TODO: Make use of command-line arguments for tests
  var applicationKeyId = ''; // Your Application Key ID
  var applicationKey = ''; // Your Application Key
  var accountId = ''; // Your Account ID
  var authData; // Auth data for other tests
  var numberOfBuckets; // Your number of buckets
  var bucketName = ''; // Bucket name for b2_create_bucket
  var bucketId; // Bucket Id for b2_update_bucket
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

    test('b2_create_bucket implementation', () async {
      var create_bucket = B2CreateBucket(
          apiUrl: authData.apiUrl,
          accountId: authData.accountId,
          authorizationToken: authData.authorizationToken,
          bucketName: bucketName);
      await create_bucket.createBucket();
      bucketId = create_bucket.data['bucketId'];
      expect(create_bucket.data['bucketName'], equals(bucketName));
    });
    // TODO: Add test for bucketType with param

    test('b2_update_bucket implementation', () async {
      var create_bucket = B2UpdateBucket(
          apiUrl: authData.apiUrl,
          accountId: authData.accountId,
          authorizationToken: authData.authorizationToken,
          bucketId: bucketId);
      await create_bucket.updateBucket();
      expect(create_bucket.data['bucketId'], equals(bucketId));
    });
  });
}
