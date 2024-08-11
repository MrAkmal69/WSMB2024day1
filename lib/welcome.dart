import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Kongsi Kereta'),
        backgroundColor: Colors.amber,
        leading: IconButton(
            onPressed: (){Navigator.pushReplacementNamed(context, '/addinfo');}, 
            icon: Icon(Icons.add)
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _fireStore.collection('AddRide').snapshots(),
          builder: (context, snapshot){
            if (!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final rides = snapshot.data!.docs;

            return ListView.builder(
              itemCount: rides.length,
                itemBuilder: (context,index){
                var ridesList = rides[index];
                var name = ridesList[index];
                var time = ridesList[index];
                var date = ridesList[index];
                var dest = ridesList[index];
                var origin = ridesList[index];
                var fare = ridesList[index];

                return Card(
                  elevation: 5,
                  color: Colors.amberAccent,
                  margin: EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Text("Name: $name"),
                          Text('Time: $time'),
                          Text('Date: $date'),
                          Text('Destination: $dest'),
                          Text('Origin: $origin'),
                          Text('Fare: $fare')

                        ],
                      )
                    ],
                  ),
                );
                }

            );
          }

      )
    );
  }
}
