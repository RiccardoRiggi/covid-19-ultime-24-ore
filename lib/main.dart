import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'ReportCovid.dart';
import 'SchedaReportCovid.dart';
import 'SchermataCrediti.dart';

Future<List<ReportCovid>> fetchPhotos(http.Client client) async {
  final response = await client.get(
      'https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale.json');
  return compute(parsePhotos, response.body);
}

List<ReportCovid> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  List<ReportCovid> lista =
      parsed.map<ReportCovid>((json) => ReportCovid.fromJson(json)).toList();
  lista = lista.reversed.toList();

  List<ReportCovid> listaDaRestituire = new List<ReportCovid>();
  ReportCovid report = lista[0];
  report.nuoviDeceduti = report.deceduti - lista[1].deceduti;
  report.nuoviDimessiGuariti = report.dimessiGuariti - lista[1].dimessiGuariti;
  report.data = report.data.substring(8, 10) +
      "/" +
      report.data.substring(5, 7) +
      "/" +
      report.data.substring(0, 4) +
      " alle ore " +
      report.data.substring(11, 13) +
      ":" +
      report.data.substring(14, 16);
  report.nuoviTamponi = report.tamponi - lista[1].tamponi;
  report.percentuale = (report.nuoviTamponi * 100) / report.tamponi;
  listaDaRestituire.add(report);
  print(listaDaRestituire);
  return listaDaRestituire;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Covid-19';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

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
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(ospedali: snapshot.data)
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

class PhotosList extends StatelessWidget {
  final List<ReportCovid> ospedali;

  PhotosList({Key key, this.ospedali}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 0.58,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemCount: ospedali.length,
      itemBuilder: (context, index) {
        return SchedaReportCovid(ospedale: ospedali[index]);
      },
    );
  }
}
