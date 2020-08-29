import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'GridReport.dart';
import 'ReportCovid.dart';
import 'SchermataCrediti.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        backgroundColor: Colors.blueAccent[700],
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.virus,
            color: Colors.white,
          ), onPressed: () {  },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.info),
            onPressed: () {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                backgroundColor: Colors.white,
                content: SchermataCrediti(),
                duration: Duration(days: 365),
              ));
            },
          ),
        ],
      ),
      body: FutureBuilder<List<ReportCovid>>(
        initialData: List(),
        future: estraiDati(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? GridReport(ospedali: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.blueAccent[700]),
                ));
        },
      ),
    );
  }
}