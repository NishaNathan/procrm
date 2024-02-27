import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:procrmapp/constants/constnts.dart';

class CalenderDatePicker extends StatefulWidget {
  const CalenderDatePicker({super.key});

  @override
  State<CalenderDatePicker> createState() => _CalenderDatePickerState();
}

class _CalenderDatePickerState extends State<CalenderDatePicker> {
  final dateController = TextEditingController();
  DateTime currentDate = DateTime.now();
  String? selectedDateForBackendDeveloper;

  Future<void> datePicker(BuildContext context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        currentDate = userSelectedDate;
        selectedDateForBackendDeveloper =
            "${currentDate.year}/${currentDate.month}/${currentDate.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final monthInWords = DateFormat.MMMM().format(currentDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                datePicker(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: lightPurple,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                '${currentDate.day} $monthInWords , ${currentDate.year}',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ), /* ElevatedButton(
            onPressed: () {
              datePicker(context);
            },
            child: Text(
              '${currentDate.day} $monthInWords', // Displaying day and month in words
            ),
          ), */
      ],
    );
  }
}
