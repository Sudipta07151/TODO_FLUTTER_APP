import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class AddTaskModal extends StatefulWidget {
  @override
  _AddTaskModalState createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final myController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                'Add A Task',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: myController,
                style: TextStyle(fontSize: 20),
                autofocus: true,
                textAlign: TextAlign.start,
                cursorColor: Colors.orange.shade900,
                cursorHeight: 25,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'My plan',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  DatePicker.showTime12hPicker(
                    context,
                    showTitleActions: true,
                    onChanged: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                      print(
                        'change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString(),
                      );
                    },
                    onConfirm: (date) {
                      print('confirm $date');
                    },
                    currentTime: DateTime.now(),
                  );
                },
                child: Text(
                  'PICK TIME TO END TASK BY',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                child: MaterialButton(
                  onPressed: () {
                    print('data: ${myController.text}');
                    print('date $selectedDate');
                    //add here task to taskslist
                    Provider.of<TaskData>(context, listen: false)
                        .addTaskToList(myController.text, selectedDate);
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_right,
                    size: 50,
                    color: Colors.white,
                  ),
                  color: Colors.orange,
                  elevation: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
