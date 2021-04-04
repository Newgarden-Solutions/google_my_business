import 'package:test/test.dart';
import 'package:google_my_business/google_my_business.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../stubs.mocks.dart';
import '../../stubs.dart';

void main() {
  const ACCOUNT_ID = "106941250772149994434";
  const DEFAULT_ADMINS_URL = '${AccountsManager.BASE_URL}/$ACCOUNT_ID/admins';

  late AccountsManager accountsManager;
  late var pageSize;

  var nextPageToken;
  var httpClientMock;

  // Mocks
  late MockGoogleSignIn mockGoogleSignIn;
  late MockGoogleSignInAccount mockGoogleSignInAccount;

  //region Initialization
  setUp(() {
    // Default values
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    GoogleMyBusiness.instance.googleSignIn = mockGoogleSignIn;

    accountsManager = AccountsManager();
    pageSize = AccountsManager.MAX_PAGE_SIZE;
    nextPageToken = null;
    httpClientMock = MockClient();

    when(GoogleMyBusiness.instance.currentUser())
        .thenReturn(mockGoogleSignInAccount);
    when(mockGoogleSignInAccount.authHeaders)
        .thenAnswer((_) => mockAuthHeaders);
  });
  //endregion

  //region Response Validators
  Future<void> _validateFetchAccounts() async {
    await accountsManager.fetchAccounts((accounts) {
      expect(accounts.length, 1);

      final account = accounts[0];

      expect(account.accountName, 'Oleg Novosad');
      expect(account.name, 'accounts/106941250772149994434');
      expect(account.primaryOwner, 'accounts/106941250772149994434');
      expect(account.type, AccountType.PERSONAL);
      expect(account.role, AccountRole.PRIMARY_OWNER);
      expect(account.verificationState, VerificationState.VERIFIED);
      expect(account.vettedState, VettedState.NOT_VETTED);
      expect(account.accountNumber, "123456789");
      expect(account.permissionLevel, PermissionLevel.OWNER_LEVEL);

      expect(account.organizationInfo, isNotNull);
      expect(account.organizationInfo!.registeredDomain, "olegnovosad.com");
      expect(account.organizationInfo!.phoneNumber, "+380000000000");
      expect(account.organizationInfo!.address, isNotNull);
      expect(account.organizationInfo!.address.regionCode, 'UA');
      expect(account.organizationInfo!.address.languageCode, 'uk-Latn');
      expect(account.organizationInfo!.address.postalCode, '49000');
      expect(account.organizationInfo!.address.administrativeArea,
          'Dnipropetrovsk oblast');
      expect(account.organizationInfo!.address.locality, 'Дніпро́');
      expect(account.organizationInfo!.address.addressLines, isNotNull);
      expect(account.organizationInfo!.address.addressLines, isNotEmpty);
      expect(account.organizationInfo!.address.addressLines.length, 2);
      expect(account.organizationInfo!.address.addressLines[0], '31Д');
    }, (error) {
      // No error should be triggered
    }, httpClientMock, nextPageToken, pageSize);
  }

  Future<void> _validateFetchAdmins() async {
    await accountsManager.fetchAdmins(ACCOUNT_ID, (admins) {
      expect(admins, isNotNull);
      expect(admins.accountAdmins, isNotNull);
      expect(admins.accountAdmins.length, 1);

      final admin = admins.accountAdmins[0];

      expect(admin.admin, 'Oleg Novosad');
      expect(admin.name, 'accounts/106941250772149994434/admins/106941250772149994434');
      expect(admin.role, AdminRole.PRIMARY_OWNER);
      expect(admin.pendingInvitation, false);
    }, (error) {
      // No error should be triggered
    }, httpClientMock);
  }
  //endregion

  group('Accounts', () {
    test('[fetchAccounts] should return a list of accounts on success',
        () async {
      when(httpClientMock.get(
              Uri.parse(
                  '${AccountsManager.BASE_URL}?pageSize=$pageSize'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(testAccountsJson, 200,
              headers:
                  await GoogleMyBusiness.instance.currentUser()!.authHeaders));

      await _validateFetchAccounts();
    });

    test(
        '[fetchAccounts] should return a list of accounts on success with next page token',
        () async {
      int count = 0;
      when(httpClientMock.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async {
        if (count++ == 1) {
          return http.Response(testAccountsJson, 200,
              headers:
                  await GoogleMyBusiness.instance.currentUser()!.authHeaders);
        } else {
          return http.Response(testAccountsNextPageJson, 200,
              headers:
                  await GoogleMyBusiness.instance.currentUser()!.authHeaders);
        }
      });

      await _validateFetchAccounts();
    });

    test(
        '[fetchAccounts] should return a list of accounts on success with page token',
        () async {
      // Custom page token
      nextPageToken = "foo";

      when(httpClientMock.get(
              Uri.parse(
                  '${AccountsManager.BASE_URL}?pageSize=$pageSize&pageToken=$nextPageToken'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(testAccountsJson, 200,
              headers:
                  await GoogleMyBusiness.instance.currentUser()!.authHeaders));

      await _validateFetchAccounts();
    });

    test('[fetchAccounts] should set page size to MAX_PAGE_SIZE if bigger',
        () async {
      pageSize = AccountsManager.MAX_PAGE_SIZE * 2;

      when(httpClientMock.get(
              Uri.parse(
                  '${AccountsManager.BASE_URL}?pageSize=${AccountsManager.MAX_PAGE_SIZE}'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(testAccountsJson, 200,
              headers:
                  await GoogleMyBusiness.instance.currentUser()!.authHeaders));

      await _validateFetchAccounts();
    });

    test('[fetchAccounts] should call on error when request fails', () async {
      when(httpClientMock.get(
              Uri.parse(
                  '${AccountsManager.BASE_URL}?pageSize=$pageSize'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('{}', 404));

      await accountsManager.fetchAccounts((accounts) {
        // No success should be triggered
      }, (error) {
        expect(error, isNull);
      }, httpClientMock, nextPageToken, pageSize);
    });

    test('[fetchAccounts] should call on error when body is empty', () async {
      when(httpClientMock.get(
              Uri.parse(
                  '${AccountsManager.BASE_URL}?pageSize=$pageSize'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('{}', 200));

      await accountsManager.fetchAccounts((accounts) {
        // No success should be triggered
      }, (error) {
        expect(error!.code, 401);
        expect(error.message, 'Failed to fetch accounts.');
        expect(error.status, 'UNAUTHORIZED');
      }, httpClientMock, nextPageToken, pageSize);
    });

    test(
        '[fetchAccounts] default client should be used if http client is null and the status code should be 401 with error response',
        () async {
      await accountsManager.fetchAccounts((accounts) {
        // No success should be triggered
      }, (error) {
        expect(error!.code, 401);
        expect(error.message,
            "Request had invalid authentication credentials. Expected OAuth 2 access token, login cookie or other valid authentication credential. See https://developers.google.com/identity/sign-in/web/devconsole-project.");
        expect(error.status, "UNAUTHENTICATED");
      });
    });
  });

  group('Admins', () {
    test('[fetchAdmins] should return admins', () async {
      when(httpClientMock.get(Uri.parse(DEFAULT_ADMINS_URL), headers: anyNamed('headers'))).thenAnswer((_) async => http.Response(testAccountAdminsJson, 200,
          headers:
          await GoogleMyBusiness.instance.currentUser()!.authHeaders));

      await _validateFetchAdmins();
    });

    test('[fetchAdmins] should call on error when request fails', () async {
      when(httpClientMock.get(
          Uri.parse(DEFAULT_ADMINS_URL),
          headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('{}', 404));

      await accountsManager.fetchAdmins(ACCOUNT_ID, (accounts) {
        // No success should be triggered
      }, (error) {
        expect(error, isNull);
      }, httpClientMock);
    });

    test('[fetchAdmins] should call on error when body is empty', () async {
      when(httpClientMock.get(
          Uri.parse(DEFAULT_ADMINS_URL),
          headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('{}', 200));

      await accountsManager.fetchAdmins(ACCOUNT_ID, (accounts) {
        // No success should be triggered
      }, (error) {
        expect(error!.code, 401);
        expect(error.message, 'Failed to fetch account admins.');
        expect(error.status, 'UNAUTHORIZED');
      }, httpClientMock);
    });

    test(
        '[fetchAdmins] default client should be used if http client is null and the status code should be 401 with error response',
            () async {
          await accountsManager.fetchAdmins(ACCOUNT_ID, (accounts) {
            // No success should be triggered
          }, (error) {
            expect(error!.code, 401);
            expect(error.message,
                "Request had invalid authentication credentials. Expected OAuth 2 access token, login cookie or other valid authentication credential. See https://developers.google.com/identity/sign-in/web/devconsole-project.");
            expect(error.status, "UNAUTHENTICATED");
          });
        });
  });
}

//region Mocks
final testAccountAdminsJson = """
{
    "accountAdmins": [
        {
            "name": "accounts/106941250772149994434/admins/106941250772149994434",
            "admin": "Oleg Novosad",
            "role": "PRIMARY_OWNER",
            "pendingInvitation": false
        }
    ]
}
""";

final testAccountsJson = """
{
    "accounts": [
        {
            "name": "accounts/106941250772149994434",
            "accountName": "Oleg Novosad",
            "primaryOwner": "accounts/106941250772149994434",
            "type": "PERSONAL",
            "role": "PRIMARY_OWNER",
            "verificationState": "VERIFIED",
            "vettedState": "NOT_VETTED",
            "accountNumber": "123456789",
            "permissionLevel": "OWNER_LEVEL",
            "organizationInfo": {
                "registeredDomain": "olegnovosad.com",
                "address": {
                    "regionCode": "UA",
                    "languageCode": "uk-Latn",
                    "postalCode": "49000",
                    "administrativeArea": "Dnipropetrovsk oblast",
                    "locality": "Дніпро́",
                    "addressLines": [
                        "31Д",
                        "проспект Слобожанський, 31Д"
                    ]
                },
                "phoneNumber": "+380000000000"
            }
        }
    ]
}
""";

final testAccountsNextPageJson = """
{
    "accounts": [],
    "nextPageToken": "foo"
}
""";
//endregion
