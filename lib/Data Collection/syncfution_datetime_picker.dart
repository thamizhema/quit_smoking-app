import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Data%20Collection/content_title.dart';
import 'package:quit_smoking/Data%20Collection/date_time_toggle.dart';
import 'package:quit_smoking/Data%20Collection/time_selector.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:velocity_x/velocity_x.dart';

class SyncfutionDatePicker extends StatefulWidget {
  const SyncfutionDatePicker({Key? key}) : super(key: key);

  @override
  _SyncfutionDatePickerState createState() => _SyncfutionDatePickerState();
}

class _SyncfutionDatePickerState extends State<SyncfutionDatePicker> {
  final sessionData = GetStorage();
  bool isDate = true;
  DateTime selectedDate = DateTime.now();
  DateTime quitDate = DateTime.now();
  bool isAm = DateTime.now().hour < 12;
  double hours = DateTime.now().hour % 12 == 0 ? 12 : DateTime.now().hour % 12;
  double minutes = DateTime.now().minute.toDouble();
  late Map userInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userInfo = sessionData.read('userInfo');
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ContentTitle(
              title: 'When You Plan to Start Your Quit Journey?',
              subtitle: "Enter your desired date here",
            ),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                // height: 370,
                width: context.screenWidth / 1.2,
                color: Colors.green[100],
                child: FittedBox(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DateTimeToggle(
                            backgroundColor: isDate
                                ? OurColors.mainColor
                                : Colors.green[100],
                            textColor: isDate
                                ? OurColors.mainTextColor
                                : OurColors.mainColor,
                            buttonText: "Date",
                            rightRadius: 0,
                            leftRadius: 5,
                            onPressed: () {
                              setState(() {
                                isDate = true;
                              });
                            },
                          ),
                          DateTimeToggle(
                            backgroundColor: isDate
                                ? Colors.green[100]
                                : OurColors.mainColor,
                            textColor: isDate
                                ? OurColors.mainColor
                                : OurColors.mainTextColor,
                            buttonText: "Time",
                            icon: Icons.more_time,
                            rightRadius: 5,
                            leftRadius: 0,
                            onPressed: () {
                              setState(() {
                                isDate = false;
                              });
                            },
                          ),
                        ],
                      ),
                      isDate
                          ? Container(
                              height: 300,
                              child: SfDateRangePicker(
                                showNavigationArrow: false,
                                backgroundColor: Colors.green[100],
                                selectionColor: Colors.green[900],
                                todayHighlightColor: Colors.green[900],
                                showActionButtons: false,
                                maxDate: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day + 7),
                                showTodayButton: false,
                                toggleDaySelection: true,
                                onSelectionChanged: (value) {
                                  selectedDate = value.value;
                                },
                              ),
                            )
                          : TimeSelector(
                              hours: hours,
                              minutes: minutes,
                              isAm: isAm,
                              hoursOnChanged: (value) {
                                setState(() {
                                  hours = value;
                                });
                              },
                              minutesOnChanged: (value) {
                                setState(() {
                                  minutes = value;
                                });
                              },
                              amPm: (value) {
                                setState(() {
                                  isAm = value;
                                });
                              },
                            ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: MaterialButton(
                            height: 50,
                            onPressed: () {
                              quitDate = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                isAm
                                    ? int.parse(hours.toStringAsFixed(0))
                                    : int.parse(
                                        (hours + 12).toStringAsFixed(0)),
                                int.parse(minutes.toStringAsFixed(0)),
                              );
                              userInfo['quitDate'] = quitDate.toString();
                              sessionData.write('userInfo', userInfo);
                              print(userInfo);
                            },
                            child: const Text('save').text.bold.size(20).make(),
                            textColor: Colors.white,
                            color: OurColors.mainColor,
                            minWidth: MediaQuery.of(context).size.width,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
