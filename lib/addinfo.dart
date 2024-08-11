import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddinfoPage extends StatefulWidget {
  const AddinfoPage({super.key});

  @override
  State<AddinfoPage> createState() => _AddinfoPageState();
}

class _AddinfoPageState extends State<AddinfoPage> {

  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var destController = TextEditingController();
  var originController = TextEditingController();
  var fareController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  String? _name, _date, _time, _dest, _origin, _fare;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Kongsi Kereta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
                child: Column(
                  children: [
                    Image.network('https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1723248000&semt=ais_hybrid',height: 200,),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.drive_file_rename_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)
                          ),
                            filled: true,
                            fillColor: Colors.yellow,
                          labelText: 'Enter Your Name',
                          hintText: 'Name'
                        ),
                        validator: (value) => value!.isEmpty ? ('Enter Your Name') : null,
                        onSaved: (value) => _name = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.date_range_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)
                            ),
                            filled: true,
                            fillColor: Colors.yellow,
                            labelText: 'Enter Date',
                            hintText: 'Date'
                        ),
                        validator: (value) => value!.isEmpty ? ('Enter Today Date') : null,
                        onSaved: (value) => _date = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: timeController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.timer_sharp),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)
                            ),
                            filled: true,
                            fillColor: Colors.yellow,
                            labelText: 'Enter Time ',
                            hintText: 'Time'
                        ),
                        validator: (value) => value!.isEmpty ? ('Please Enter Time') : null,
                        onSaved: (value) => _time = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: destController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.place),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)
                            ),
                            filled: true,
                            fillColor: Colors.yellow,
                            labelText: 'Enter Your Destination',
                            hintText: 'Destination'
                        ),
                        validator: (value) => value!.isEmpty ? ('Enter Your Destination') : null,
                        onSaved: (value) => _dest = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: originController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.trip_origin),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)
                            ),
                            filled: true,
                            fillColor: Colors.yellow,
                            labelText: 'Enter Your Origin',
                            hintText: 'Origin'
                        ),
                        validator: (value) => value!.isEmpty ? ('Enter Your Origin') : null,
                        onSaved: (value) => _origin = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: fareController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.monetization_on_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)
                            ),
                            filled: true,
                            fillColor: Colors.yellow,
                            labelText: 'Enter Your Fare',
                            hintText: 'Fare'
                        ),
                        validator: (value) => value!.isEmpty ? ('Enter Fare Amount') : null,
                        onSaved: (value) => _fare = value,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: uploadDriver,
                            child: Text('Submit')

                        )
                      ],
                    )
                  ],
                )
            ),
          ],
        ),
      )
    );
  }
  Future<void> selectedImage() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime(2100)
    );
    if (_picked != null){
      setState(() {
        dateController.text = _picked.toString().split("")[0];
      });
    }
  }

  Future<void> uploadDriver() async{
    if(_formKey.currentState!.validate()){
    _formKey.currentState!.save();
    }
    await _firestore.collection('AddRide').add({
      'name' : _name,
      'date' : _date,
      'time' : _time,
      'destination' : _dest,
      'origin': _origin,
      'fare' : _fare,
    });
    Navigator.pushReplacementNamed(context, '/welcome');
  }
}
