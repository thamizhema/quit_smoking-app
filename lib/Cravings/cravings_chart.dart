import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/qc_getx_controller/cravings_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CravingsChart extends StatelessWidget {
  final CravingsController _cravingsController = Get.find<CravingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SfCartesianChart(
        title: ChartTitle(text: 'Your cravings'),
        legend: Legend(isVisible: true),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        series: <ChartSeries>[
          LineSeries(
            name: 'Cravings',
            color: OurColors.mainColor,
            dataSource: _cravingsController.cravingsList.value,
            xValueMapper: (cravings, _) => cravings['day'],
            yValueMapper: (cravings, _) => cravings['howStrong'],
          ),
        ],
      ),
    );
  }
}
