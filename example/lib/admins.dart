import 'package:flutter/material.dart';
import 'package:google_my_business/google_my_business.dart';

enum Type { ACCOUNT, LOCATION }

class Admins extends StatefulWidget {
  final String id;
  final Account account;
  final Type type;

  Admins({required this.account, required this.id, required this.type});

  @override
  _AdminsState createState() => _AdminsState();
}

class _AdminsState extends State<Admins> {
  List<Admin> admins = <Admin>[];
  bool _isLoading = true;
  late AccountsManager _accountsManager;
  late LocationsManager _locationsManager;

  @override
  void initState() {
    super.initState();

    _accountsManager = AccountsManager();
    _locationsManager =
        LocationsManager(accountId: widget.account.name.split("/")[1]);

    if (GoogleMyBusiness.instance.currentUser() != null) {
      _fetchAdmins(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admins'),
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
          itemCount: admins.length,
          itemBuilder: (context, index) {
            final admin = admins[index];
            return ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.security),
              ),
              title: Text('${admin.admin}'),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                    "Type: ${admin.role},\nID: ${admin.name.split("/")[1]}"),
              ),
              onTap: () {},
            );
          },
        ),
        onRefresh: () {
          admins.clear();
          return _fetchAdmins(widget.id);
        },
      );
    }
  }

  Future<void> _fetchAdmins(String accountId) async {
    switch (widget.type) {
      case Type.ACCOUNT:
        await _accountsManager.fetchAdmins(accountId, (admins) async {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Total admins: ${admins.accountAdmins.length}')));

          setState(() {
            this.admins = admins.accountAdmins;
            _isLoading = false;
          });
        }, (error) {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('$error'),
              backgroundColor: Colors.red.shade900,
            ));
          });
        });
        break;
      case Type.LOCATION:
        await _locationsManager.fetchAdmins(accountId, (admins) async {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Total admins: ${admins.admins.length}')));

          setState(() {
            this.admins = admins.admins;
            _isLoading = false;
          });
        }, (error) {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('$error'),
              backgroundColor: Colors.red.shade900,
            ));
          });
        });
        break;
    }
  }
}
