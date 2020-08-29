import 'package:flutter/material.dart';

import 'ReportCovid.dart';
import 'RigaSchedaReport.dart';
import 'RigaSchedaTampone.dart';

class SchedaReportCovid extends StatelessWidget {
  final ReportCovid ospedale;

  const SchedaReportCovid({Key key, @required this.ospedale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RigaSchedaReport("CONTAGIATI", Colors.redAccent,
                  ospedale.totalePositivi, ospedale.variazioneTotalePositivi),
              SizedBox(
                height: 8,
              ),
              RigaSchedaReport("DECEDUTI", Colors.black, ospedale.deceduti,
                  ospedale.nuoviDeceduti),
              SizedBox(
                height: 8,
              ),
              RigaSchedaReport("GUARITI", Colors.green, ospedale.dimessiGuariti,
                  ospedale.nuoviDimessiGuariti),
              SizedBox(
                height: 8,
              ),
              RigaSchedaReport("TOTALE", Colors.grey, ospedale.totaleCasi,
                  ospedale.nuoviPositivi),
              SizedBox(
                height: 8,
              ),
              RigaSchedaTampone("TAMPONI", Colors.lightBlueAccent,
                  ospedale.tamponi, ospedale.nuoviTamponi, ospedale.percentuale)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Text(
                  "Dati aggiornati al " + ospedale.data,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
