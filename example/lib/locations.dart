import 'package:flutter/material.dart';
import 'package:google_my_business/google_my_business.dart'
    show GoogleMyBusiness, Account, Location, LocationsManager;

import 'admins.dart';

class Locations extends StatefulWidget {
  final Account account;

  Locations(this.account);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  List<Location> locations = <Location>[];
  bool _isLoading = true;
  late LocationsManager _locationsManager;

  @override
  void initState() {
    super.initState();

    _locationsManager =
        LocationsManager(accountId: widget.account.name.split("/")[1]);
    if (GoogleMyBusiness.instance.currentUser() != null) {
      _fetchLocations();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
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
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final location = locations[index];
            return ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.location_on),
              ),
              title: Text('${location.locationName}'),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                    "${location.address?.locality},\n${location.address?.addressLines.join(', ')}"),
              ),
              trailing: IconButton(
                  icon: Icon(
                    Icons.group,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    if (location.name == null) {
                      return;
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Admins(
                                account: widget.account,
                                type: Type.LOCATION,
                                id: location.name!.split("/")[3])));
                  }),
            );
          },
        ),
        onRefresh: () {
          locations.clear();
          return _fetchLocations();
        },
      );
    }
  }

  Future<void> _fetchLocations() async {
    await _locationsManager.fetchLocations((locations) async {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Total locations: ${locations.length}")));

      setState(() {
        this.locations = locations;
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
  }
}
