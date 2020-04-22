import 'package:backblaze_b2_dart/b2_authorize_account.dart';
import 'package:test/test.dart';

void main() {
  // TODO: Make use of command-line arguments for tests
  test('BackBlaze B2 b2_authorize_account implementation', () async {
    var applicationKeyId = ''; // Your Application Key ID
    var applicationKey = ''; // Your Application Key
    var accountId = ''; // Your Account ID

    var auth = B2AuthorizeAccount(
        applicationKeyId: applicationKeyId, applicationKey: applicationKey);
    await auth.authorizeAccount();
    expect(auth.data['accountId'], equals(accountId));
  });
}
