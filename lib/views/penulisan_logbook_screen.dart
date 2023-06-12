import 'package:flutter/material.dart';

class LogbookEntry {
  late DateTime date;
  late TimeOfDay time;
  late String activity;
  late String description;

  LogbookEntry({
    required this.date,
    required this.time,
    required this.activity,
    required this.description,
  });
}

class PenulisanPage extends StatefulWidget {
  const PenulisanPage({Key? key}) : super(key: key);

  @override
  State<PenulisanPage> createState() => _PenulisanPageState();
}

class _PenulisanPageState extends State<PenulisanPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<LogbookEntry> logbookEntries = [];

  late TextEditingController _activityController;
  late TextEditingController _descriptionController;
  late TextEditingController _timeController;
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _activityController = TextEditingController();
    _descriptionController = TextEditingController();
    _timeController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _activityController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text = selectedDate.toString().split(' ')[0];
      });
    }
  }

  void _showTimePicker(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _timeController.text = selectedTime.format(context);
      });
    }
  }

  void _saveLogbookEntry() {
    if (_formKey.currentState!.validate()) {
      String activity = _activityController.text;
      String description = _descriptionController.text;
      String time = _timeController.text;
      String date = _dateController.text;

      LogbookEntry entry = LogbookEntry(
        date: DateTime.now(),
        time: TimeOfDay.now(),
        activity: activity,
        description: description,
      );

      setState(() {
        logbookEntries.add(entry);
      });

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log Book'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InkWell(
                onTap: () => _showTimePicker(context),
                child: IgnorePointer(
                  child: TextFormField(
                    controller: _timeController,
                    decoration: InputDecoration(labelText: 'Waktu'),
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
              InkWell(
                onTap: () => _showDatePicker(context),
                child: IgnorePointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(labelText: 'Tanggal'),
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
              TextFormField(
                controller: _activityController,
                decoration: InputDecoration(labelText: 'kegiatan'),
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
                decoration: InputDecoration(labelText: 'Deskripsi Kegiatan'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Ink(
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                    onTap: () => _saveLogbookEntry(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: logbookEntries.length,
                  itemBuilder: (context, index) {
                    LogbookEntry entry = logbookEntries[index];
                    String formattedDate = entry.date.toString().split(' ')[0];
                    String formattedTime = entry.time.format(context);

                    return ListTile(
                      title: Text('Activity: ${entry.activity}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: $formattedDate'),
                          Text('Time: $formattedTime'),
                          Text('Description: ${entry.description}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
