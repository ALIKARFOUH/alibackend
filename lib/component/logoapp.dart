import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  String _selectedGender = 'male';
  String _ageRangeValue = '18-30';
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuration'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  child: Text('Select Gender'),
                  value: '',
                ),
                DropdownMenuItem(
                  child: Text('Male'),
                  value: 'male',
                ),
                DropdownMenuItem(
                  child: Text('Female'),
                  value: 'female',
                ),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Gender',
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ADD ID',
              ),
              onChanged: (String value) {
                // Handle ADD ID input
              },
            ),
            SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: _ageRangeValue,
              onChanged: (value) {
                setState(() {
                  _ageRangeValue = value!;
                });
              },
              items: [
                DropdownMenuItem(
                  child: Text('Select Age Range'),
                  value: '',
                ),
                DropdownMenuItem(
                  child: Text('18-30'),
                  value: '18-30',
                ),
                DropdownMenuItem(
                  child: Text('31-45'),
                  value: '31-45',
                ),
                DropdownMenuItem(
                  child: Text('46-60'),
                  value: '46-60',
                ),
                DropdownMenuItem(
                  child: Text('60+'),
                  value: '60+',
                ),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ADD description',
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () async {
                      final DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );

                      if (newDate != null) {
                        setState(() {
                          _selectedDate = newDate;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blueAccent.withOpacity(0.4))),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'ADD Date',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () async {
                      final TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (newTime != null) {
                        setState(() {
                          _selectedTime = newTime;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blueAccent.withOpacity(0.4)),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'ADD time',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent.withOpacity(0.4)),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                _description,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[600],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(
                'ADD',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
