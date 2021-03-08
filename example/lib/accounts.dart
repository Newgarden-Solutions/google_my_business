import 'package:flutter/material.dart';
import 'package:google_my_business/google_my_business.dart';

import 'locations.dart';
import 'login.dart';

class Accounts extends StatefulWidget {
  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  List<Account> accounts = <Account>[];
  bool _isLoading = true;
  late AccountsManager _accountsManager;

  @override
  void initState() {
    super.initState();

    _accountsManager = AccountsManager();
    if (GoogleMyBusiness.instance.currentUser() != null) {
      _fetchAccounts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                GoogleMyBusiness.instance.signOut().then((value) =>
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login())));
              })
        ],
      ),
      body: _buildLocationListWidget(),
    );
  }

  Widget _buildLocationListWidget() {
    if (_isLoading) {
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Padding(padding: EdgeInsets.all(16.0), child: Text('Loading...'))
            ]),
      );
    } else {
      return RefreshIndicator(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            final account = accounts[index];
            return ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text('${account.accountName}'),
              subtitle: Text(
                  "Type: ${account.type},\nID: ${account.name.split("/")[1]}"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Locations(account)));
              },
            );
          },
        ),
        onRefresh: () {
          accounts.clear();
          return _fetchAccounts();
        },
      );
    }
  }

  Future<void> _fetchAccounts() async {
    await _accountsManager.fetchAccounts((accounts) async {
      print("Total accounts: ${accounts?.length}");

      setState(() {
        this.accounts = accounts ?? [];
        _isLoading = false;
      });
    }, (error) {
      setState(() {
        print('Google My Business API: ${error?.code} - ${error?.message}');
      });
    });
  }
}
