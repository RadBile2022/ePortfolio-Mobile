import 'package:flutter/material.dart';

class Data {
  final String name;
  final DateTime date;

  Data({required this.name, required this.date});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Data> array1 = [
    Data(name: 'Data 1', date: DateTime(2022, 1, 1)),
    Data(name: 'Data 2', date: DateTime(2021, 12, 31)),
    Data(name: 'Data 3', date: DateTime(2022, 2, 15)),
  ];

  final List<Data> array2 = [
    Data(name: 'Data 4', date: DateTime(2023, 6, 1)),
    Data(name: 'Data 5', date: DateTime(2023, 5, 15)),
    Data(name: 'Data 6', date: DateTime(2023, 6, 20)),
  ];

  List<Data> mergedAndSortedArray() {
    List<Data> mergedArray = [];
    mergedArray.addAll(array1);
    mergedArray.addAll(array2);

    mergedArray.sort((a, b) => b.date.compareTo(a.date)); // Urutkan secara descending (semakin terbaru semakin di atas)

    return mergedArray;
  }

  @override
  Widget build(BuildContext context) {
    List<Data> mergedArray = mergedAndSortedArray();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menggabungkan dan Mengurutkan Array Objek'),
        ),
        body: ListView.builder(
          itemCount: mergedArray.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(mergedArray[index].name),
              subtitle: Text(mergedArray[index].date.toString()),
            );
          },
        ),
      ),
    );
  }
}
