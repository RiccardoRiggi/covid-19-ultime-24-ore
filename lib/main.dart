import 'dart:async';
import 'dart:convert';
import 'package:covid_19/HomePage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ReportCovid.dart';

Future<List<ReportCovid>> estraiDati(http.Client client) async {
  final response = await client.get(
      'https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-andamento-nazionale.json');
  return compute(parseReport, response.body);
}

List<ReportCovid> parseReport(String responseBody) {
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
      home: HomePage(title: appTitle),
    );
  }
}




