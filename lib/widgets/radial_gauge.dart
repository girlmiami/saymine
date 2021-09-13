import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadialGaugeWidget extends StatelessWidget {
  final String? title;
  final double value;

  RadialGaugeWidget({Key? key, this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfRadialGauge(
        animationDuration: 5000,
        title: GaugeTitle(
          text: "$title",
          textStyle: TextStyle(
            fontSize: 30.0.h,
            fontWeight: FontWeight.bold,
          ),
          alignment: GaugeAlignment.center,
        ),
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            canScaleToFit: true,
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        '$value %',
                        style: TextStyle(
                          fontSize: 60.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'actions taken',
                            style: TextStyle(
                              fontSize: 30.h,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.info_outline,
                              size: 20.h,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                angle: 90,
                positionFactor: 0,
              ),
            ],
            minimum: 0,
            maximum: 100,
            startAngle: 180,
            endAngle: 360,
            showTicks: false,
            showFirstLabel: true,
            showLastLabel: true,
            axisLabelStyle: GaugeTextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
            maximumLabels: 0,
            labelFormat: "{value}%",
            labelsPosition: ElementsPosition.inside,
            axisLineStyle: AxisLineStyle(
              cornerStyle: CornerStyle.bothCurve,
              thickness: 15,
            ),
            pointers: [
              RangePointer(
                value: value,
                enableAnimation: true,
                animationDuration: 5000,
                color: Theme.of(context).primaryColor,
                width: 15,
                cornerStyle: CornerStyle.startCurve,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
