import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'modelas/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final moviesRef = FirebaseFirestore.instance
        .collection('movie')
        .withConverter<Movie>(
          fromFirestore: (snapshots, _) => Movie.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );

    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Movie>>(
        stream: moviesRef.snapshots(),
        builder: (context, snapshot) {
          final data = snapshot.requireData;
          return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(height: 12);
              },
              itemCount: data.size,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    SizedBox(width: 8),
                    Text(
                      (index + 1).toString(),
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 12),
                    Text(
                      snapshot.data!.docs[index].data().name ?? "",
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
