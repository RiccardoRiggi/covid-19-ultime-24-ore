class ReportCovid {
  String data;
  int variazioneTotalePositivi; //1103
  int deceduti; //35472
  int nuoviDeceduti; //OGGI - IERI //9
  int dimessiGuariti; //206902
  int nuoviDimessiGuariti; //OGGI - IERI //348
  int nuoviPositivi; //1462
  int totaleCasi; //265409
  int totalePositivi;
  int tamponi;
  int nuoviTamponi;
  double percentuale;

  factory ReportCovid.fromJson(Map<String, dynamic> json) {

    return ReportCovid(
      json['data'] as String,
      json['variazione_totale_positivi'] as int,
      json['deceduti'] as int,
      json['dimessi_guariti'] as int,
      json['nuovi_positivi'] as int,
      json['totale_casi'] as int,
      json['tamponi'] as int,
      json['totale_positivi'] as int,
    );
  }

  ReportCovid(this.data, this.variazioneTotalePositivi, this.deceduti,
      this.dimessiGuariti, this.nuoviPositivi, this.totaleCasi,this.tamponi,this.totalePositivi);
}
