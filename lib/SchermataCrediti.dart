import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


/*
  CLASSE CHE CONTIENE LA SCHERMATA DEI CREDITI
*/
class SchermataCrediti extends StatelessWidget {
  final String descrizioneUno =
      "I dati relativi al Coronavirus mostrati in quest'applicazione vengono forniti dal Dipartimento della Protezione Civile";
  final String descrizioneDue =
      "Tuttavia le informazioni riportate potrebbero non essere del tutto corrette. Si consiglia di seguire gli aggiornamenti sul sito http://www.salute.gov.it/portale/nuovocoronavirus/";
  final String descrizioneTre =
      "In caso di malessere chiama il Numero unico di emergenza 112 oppure il medico curante";

  final String descrizioneQuattro = "Developed By Riccardo Riggi";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 36, 0, 0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.viruses,
                  color: Colors.blueAccent[700],
                  size: 50,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(
                  "Covid-19",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  descrizioneUno,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  maxLines: 15,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  descrizioneDue,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  maxLines: 15,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(
                  descrizioneTre,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  maxLines: 15,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 3.0,
            width: 300,
            color: Colors.blueAccent[700],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  descrizioneQuattro,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 15,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    launch('https://www.linkedin.com/in/riccardoriggi/');
                  }),
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    launch('https://www.riccardoriggi.it/');
                  }),
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    launch('https://github.com/RiccardoRiggi');
                  }),
            ],
          )
        ],
      ),
    );
  }
}
