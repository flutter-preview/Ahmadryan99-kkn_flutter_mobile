import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PenulisanPage extends StatefulWidget {
  final LogbookEntry? entry;

  const PenulisanPage({this.entry});

  @override
  _PenulisanPageState createState() => _PenulisanPageState();
}

class _PenulisanPageState extends State<PenulisanPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    if (widget.entry != null) {
      _activityController.text = widget.entry!.activity;
      _descriptionController.text = widget.entry!.description;
      _selectedDate = widget.entry!.date;
      _selectedTime = widget.entry!.time;
    }
  }

  @override
  void dispose() {
    _activityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry != null ? 'Edit Log Book' : 'Add Log Book'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => _showTimePicker(context),
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: _getTimeController(),
                        decoration: InputDecoration(labelText: 'Waktu'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select the time';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => _showDatePicker(context),
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: _getDateController(),
                        decoration: InputDecoration(labelText: 'Tanggal'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select the date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _activityController,
                    decoration: InputDecoration(labelText: 'Kegiatan'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the activity';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Deskripsi'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          LogbookEntry newEntry = LogbookEntry(
                            activity: _activityController.text,
                            description: _descriptionController.text,
                            time: _selectedTime!,
                            date: _selectedDate!,
                          );
                          _saveLogbookEntry(newEntry); // Simpan entri logbook
                          Navigator.pop(context, newEntry);
                        }
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        ),
                      ),
                      child: Text(
                          widget.entry != null ? 'Save Changes' : 'Simpan'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController _getTimeController() {
    return TextEditingController(
      text: _selectedTime != null
          ? '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}'
          : '',
    );
  }

  TextEditingController _getDateController() {
    return TextEditingController(
      text: _selectedDate != null
          ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
          : '',
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }

  void _saveLogbookEntry(LogbookEntry entry) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String entryKey = 'logbook_entry_${entry.date.toString()}';
    prefs.setString(entryKey, entry.toJson() as String);
  }
}

class LogbookEntry {
  final DateTime date;
  final TimeOfDay time;
  final String activity;
  final String description;

  LogbookEntry({
    required this.date,
    required this.time,
    required this.activity,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
      'activity': activity,
      'description': description,
    };
  }
}
