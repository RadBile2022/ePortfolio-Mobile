import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final VoidCallback $onTapEditHoriz;
//   final VoidCallback $onTapDeleteHoriz;
//   final BottomSheetController bottomSheetController = Get.put(
//       BottomSheetController());
//
//    MyApp({super.key, required this.$onTapEditHoriz, required this.$onTapDeleteHoriz});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Modal Bottom Sheet Demo',
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey,
//         appBar: AppBar(
//           title: const Text('Creating a Modal Bottom Sheet'),
//           backgroundColor: Colors.black38,
//         ),
//         body: Center(
//           child: ElevatedButton(
//             child: Text('Show Modal Bottom Sheet'),
//             onPressed: () {
//               bottomSheetController.toggleBottomSheet();
//             },
//           ),
//         ),
//         // Observe the bottom sheet state and show/hide the sheet accordingly
//         bottomSheet: Obx(
//               () {
//             return Visibility(
//               visible: bottomSheetController.isBottomSheetOpen.value,
//               child: BottomSheetHoriz($onTapEditHoriz: $onTapEditHoriz, $onTapDeleteHoriz: $onTapDeleteHoriz),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class BottomSheetHoriz extends StatelessWidget {
  final VoidCallback $onTapEditHoriz;
  final VoidCallback $onTapDeleteHoriz;

  const BottomSheetHoriz({
    super.key,
    required this.$onTapEditHoriz,
    required this.$onTapDeleteHoriz,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          title: Center(
            child: Text('Pilih Operasi'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.copy),
          title: Text('Copy Link'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit'),
          onTap: $onTapEditHoriz,
        ),
        ListTile(
          leading: Icon(Icons.delete, color: Colors.red,),
          title: Text('Delete', style: TextStyle(color: Colors.red),),
          onTap: $onTapDeleteHoriz,
        ),
      ],
    );
  }
}

class BottomSheetController extends GetxController {
  RxBool isBottomSheetOpen = false.obs;
  RxString id = ''.obs;

  void toggleBottomSheet() {
    isBottomSheetOpen.value = !isBottomSheetOpen.value;
  }

}

/// MENGGUNAKAN STATEFUL WIDGET
class MyAppS extends StatefulWidget {
  const MyAppS({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppS> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modal Bottom Sheet Demo',
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('Creating a Modal Bottom Sheet'),
          backgroundColor: Colors.black38,
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: ElevatedButton(
                child: Text('Show Modal Bottom Sheet'),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          ListTile(
                            title: Center(
                              child: Text('Pilih Operasi'),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.share),
                            title: Text('Share'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(Icons.copy),
                            title: Text('Copy Link'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Edit'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),
                            onTap: () {},
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DropdownExample extends StatelessWidget {
  // PopupMenuItemSelected $onSelectedHoriz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown untuk Edit dan Delete'),
      ),
      body: Center(
        child: PopupMenuButton<int>(
          icon: Icon(Icons.more_horiz),
          onSelected: (int result) {
            // Ketika salah satu item dropdown dipilih, lakukan sesuatu berdasarkan nilai yang dipilih.
            if (result == 0) {
              // Lakukan tindakan edit di sini.
            } else if (result == 1) {
              // Lakukan tindakan delete di sini.
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            PopupMenuItem<int>(
              value: 0, // Nilai yang akan dipassing ketika "Edit" dipilih.
              child: Row(
                children: const [
                  Icon(Icons.edit),
                  SizedBox(width: 8),
                  Text('Edit'),
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 1, // Nilai yang akan dipassing ketika "Delete" dipilih.
              child: Row(
                children: const [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
