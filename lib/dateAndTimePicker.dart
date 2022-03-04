import 'package:flutter/material.dart';

class DateNTimePickerDemo extends StatefulWidget {
  const DateNTimePickerDemo({Key? key}) : super(key: key);

  @override
  _DateNTimePickerDemoState createState() => _DateNTimePickerDemoState();
}

class _DateNTimePickerDemoState extends State<DateNTimePickerDemo> {
  String dateset = '';
  String setedTime='';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () async {
                  DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2025));

                  String selectedDate = date!.day.toString() +
                      '/' +
                      date.month.toString() +
                      '/' +
                      date.year.toString();
                  print(selectedDate.toString());
                  setState(() {
                    dateset = selectedDate;
                  });
                },
                child: Text('datepicker'),
                color: Colors.blueGrey,
              ),
              MaterialButton(
                onPressed: () async {
                  TimeOfDay? time = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now()

                  );
                  //String selectedTime = time!.hour>12 ? (time.hour-12).toString() :time.hour.toString() + '-'
                  //    +time.minute.toString();
                  String selectedTime= time!.hour.toString() +'/'+time.minute.toString();
                  setState(() {
                    setedTime= selectedTime.toString();
                  });

                },
                child: Text('timepicker'),
                color: Colors.blueGrey,
              ),
              Text(dateset),
              Text( setedTime ),
            ],
          ),
        ),
      ),
    );
  }
}
