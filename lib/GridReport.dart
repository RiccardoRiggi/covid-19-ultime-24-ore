import 'package:flutter/material.dart';

import 'ReportCovid.dart';
import 'SchedaReportCovid.dart';

class GridReport extends StatelessWidget {
  final List<ReportCovid> ospedali;

  GridReport({Key key, this.ospedali}) : super(key: key);

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