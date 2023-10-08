import 'dart:io';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flut_labs/pageWithButtons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PageWithList extends StatefulWidget {
  const PageWithList({super.key});

  @override
  _PageWithListState createState() => _PageWithListState();
}

class Product {
  final String name;
  final double cost;
  File? image;

  Product({required this.name, required this.cost, this.image});
}

class _PageWithListState extends State<PageWithList> {
  List<Product> _products = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  // final List<String> names = <String>['Aby', 'Aish', 'Ayan', 'Ben', 'Bob'];
  // final List<int> numbersa = <int>[2, 0, 10, 6, 52];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration:
            const Duration(seconds: 2), // Длительность отображения подсказки
      ),
    );
  }

  void _addProductInList() {
    setState(() {
      _products.add(Product(
          name: nameController.text,
          cost: double.parse(numberController.text)));
    });
  }

  Future<void> _addImageForProduct(Product product) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      setState(() {
        product.image = imageFile;
      });
      _showSnackBar('Изображение добавлено для продукта: ${product.name}');
    } else {
      _showSnackBar('Изображение не выбрано');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(114, 117, 117, 1),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PageWithList())),
                        splashColor: Colors.yellowAccent,
                        splashRadius: 50,
                        highlightColor: Colors.black,
                        icon: Icon(Icons.code),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 166, 22, 22),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PageWithList())),
                        splashColor: Colors.yellowAccent,
                        splashRadius: 50,
                        highlightColor: Colors.black,
                        icon: Icon(Icons.code),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PageWithList())),
                        splashColor: Colors.yellowAccent,
                        splashRadius: 50,
                        highlightColor: Colors.black,
                        icon: Icon(Icons.code),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Color.fromRGBO(168, 167, 167, 1),
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 156, 155, 155)),
                      hintText: 'Введите имя',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      labelText: 'Имя',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(148, 148, 148, 1), width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1), width: 3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: numberController,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 156, 155, 155)),
                      hintText: 'Введите число',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      labelText: 'Число',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(148, 148, 148, 1), width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1), width: 3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      _addProductInList();
                    },
                    label: 'Добавить',
                  ),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.95,
              child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = _products[index];
                    return Container(
                      color: Colors.black26,
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListTile(
                        textColor: Color.fromRGBO(57, 57, 57, 1),
                        tileColor: Color(0xFFFBFBFB),
                        title: Text(product.name),
                        subtitle: Text('cost: ${product.cost.toString()}'),
                        trailing: GestureDetector(
                            onTap: () {
                              _addImageForProduct(product);
                            },
                            child: CircleAvatar(
                              backgroundColor: const Color.fromARGB(255, 47, 47, 47),
                              radius: 20,
                              backgroundImage: product.image != null
                                  ? FileImage(product.image!)
                                  : null,
                              child: product.image == null
                                  ? Icon(Icons
                                      .image) 
                                  : null,
                            )),
                      ),
                    );
                  }),
            )

            //),
          ],
        ));
  }
}

// Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[

//     SizedBox(
//       child: Column(children: [
//         SizedBox(
//           //width: MediaQuery.of(context).size.width * 0.8,
//           child: TextField(
//             controller: nameController,
//             decoration: InputDecoration(
//               labelText: 'Name',
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//                 borderSide: BorderSide(color: Colors.black, width: 3),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//                 borderSide: BorderSide(
//                     color: Color.fromRGBO(106, 107, 106, 1), width: 3),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20.0),
//         SizedBox(
//           //width: MediaQuery.of(context).size.width * 0.8,
//           child: TextField(
//             keyboardType: TextInputType.number,
//             controller: numberController,
//             decoration: InputDecoration(
//               labelText: 'Number',
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//                 borderSide: BorderSide(color: Colors.black, width: 3),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//                 borderSide: BorderSide(
//                     color: Color.fromRGBO(106, 107, 106, 1), width: 3),
//               ),
//             ),
//           ),
//         ),
//         CustomElevatedButton(
//           onPressed: () {
//             _addProductInList();
//           },
//           label: 'Добавить',
//         ),
//       ]),
//     ),
//     SizedBox(
//       width: MediaQuery.of(context).size.width * 0.9,
//       height: MediaQuery.of(context).size.height * 0.5,
//       child: ListView.builder(
//         itemCount: _products.length,
//         itemBuilder: (BuildContext context, int index) {
//           final product = _products[index];
//           return SizedBox(
//             //width: MediaQuery.of(context).size.width * 0.9,
//             // height: 300,
//             child: ListTile(
//               title: Text(product.name),
//               subtitle: Text('cost: ${product.cost.toString()}'),
//               trailing: GestureDetector(
//                 onTap: () {
//                   _addImageForProduct(product);
//                 },
//                 child: CircleAvatar(
//                   radius: 20,
//                   backgroundImage: product.image != null
//                       ? FileImage(product.image!)
//                       : null,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//   ],
// ),
//);

// class ItemCard extends StatefulWidget {
//   const ItemCard({super.key});

//   @override
//   State<ItemCard> createState() => _ItemCardState();
// }

// class _ItemCardState extends State<ItemCard> {
//   List<File> selectedImages = [];
//   final picker = ImagePicker();

//   Future getImages() async {
//     final pickedFile = await picker.pickMultiImage(
//         requestFullMetadata: true,
//         imageQuality: 100,
//         maxHeight: 1000,
//         maxWidth: 1000);
//     List<XFile> xfilePick = pickedFile;

//     setState(
//       () {
//         if (xfilePick.isNotEmpty) {
//           for (var i = 0; i < xfilePick.length; i++) {
//             selectedImages.add(File(xfilePick[i].path));
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
//               const SnackBar(content: Text('Nothing is selected')));
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 120,
//       height: MediaQuery.of(context).size.height * 0.8,
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.symmetric(horizontal: 6),
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           spreadRadius: 1,
//           blurRadius: 1,
//           offset: Offset(0, 1), // changes position of shadow
//         ),
//       ], borderRadius: BorderRadius.circular(10), color: Colors.white),
//       child: Column(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.green)),
//                 child: const Text('Select File Image'),
//                 onPressed: () {
//                   getImages();
//                 },
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 18.0),
//                 child: Text(
//                   "GFG",
//                   textScaleFactor: 3,
//                   style: TextStyle(color: Colors.green),
//                 ),
//               ),
//               Expanded(
//                 child: SizedBox(
//                   width: 300.0,
//                   child: selectedImages.isEmpty
//                       ? const Center(child: Text('Sorry nothing selected!!'))
//                       : GridView.builder(
//                           itemCount: selectedImages.length,
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 3),
//                           itemBuilder: (BuildContext context, int index) {
//                             return Center(
//                                 child: kIsWeb
//                                     ? Image.network(
//                                         selectedImages[index].path,
//                                         height: 100,
//                                         width: 100,
//                                         fit: BoxFit.fill,
//                                         alignment: Alignment.center,
//                                       )
//                                     : Image.file(
//                                         selectedImages[index],
//                                         height: 100,
//                                         width: 100,
//                                         fit: BoxFit.fill,
//                                         alignment: Alignment.center,
//                                       ));
//                           },
//                         ),
//                 ),
//               ),
//             ],
//           ),
//           // Image.network(
//           //   'https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/1502591/cabbage-clipart-md.png',
//           //   height: 100,
//           // ),
//           const Align(
//             child: Text(
//               "Cabbages",
//               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//             alignment: Alignment.centerLeft,
//           ),
//           SizedBox(
//             height: 4,
//           ),
//           const Row(
//             children: [
//               Text("\$5.5",
//                   style: TextStyle(fontSize: 12, color: Colors.amber)),
//               SizedBox(
//                 width: 4,
//               ),
//               Expanded(
//                 child: Text(
//                   "per piece",
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontSize: 10, color: Colors.amber),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class PageWithList extends StatelessWidget {
//   const PageWithList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final titles = [
//       'bike',
//       'boat',
//       'bus',
//       'car',
//       'railway',
//       'run',
//       'subway',
//       'transit',
//       'car',
//       'railway',
//       'run',
//       'subway',
//       'transit',
//       'walk'
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 144, 146, 144),
//         title: const Text('New Screen'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) => ItemCard(),
//         itemCount: titles.length,
//         scrollDirection: Axis.vertical,
//       ),
//     );
//   }
// }

// class MultipleImageSelector extends StatefulWidget {
//   const MultipleImageSelector({super.key});

//   @override
//   State<MultipleImageSelector> createState() => _MultipleImageSelectorState();
// }

// class _MultipleImageSelectorState extends State<MultipleImageSelector> {
//   List<File> selectedImages = [];
//   final picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     // display image selected from gallery
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('File image select'),
//         backgroundColor: Colors.green,
//         actions: const [],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.green)),
//               child: const Text('Select File Image'),
//               onPressed: () {
//                 getImages();
//               },
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 18.0),
//               child: Text(
//                 "GFG",
//                 textScaleFactor: 3,
//                 style: TextStyle(color: Colors.green),
//               ),
//             ),
//             Expanded(
//               child: SizedBox(
//                 width: 300.0,
//                 child: selectedImages.isEmpty
//                     ? const Center(child: Text('Sorry nothing selected!!'))
//                     : GridView.builder(
//                         itemCount: selectedImages.length,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 3),
//                         itemBuilder: (BuildContext context, int index) {
//                           return Center(
//                               child: kIsWeb
//                                   ? Image.network(
//                                       selectedImages[index].path,
//                                       height: 100,
//                                       width: 100,
//                                       fit: BoxFit.fill,
//                                       alignment: Alignment.center,
//                                     )
//                                   : Image.file(
//                                       selectedImages[index],
//                                       height: 100,
//                                       width: 100,
//                                       fit: BoxFit.fill,
//                                       alignment: Alignment.center,
//                                     ));
//                         },
//                       ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future getImages() async {
//     final pickedFile = await picker.pickMultiImage(
//         requestFullMetadata: true,
//         imageQuality: 100,
//         maxHeight: 1000,
//         maxWidth: 1000);
//     List<XFile> xfilePick = pickedFile;

//     setState(
//       () {
//         if (xfilePick.isNotEmpty) {
//           for (var i = 0; i < xfilePick.length; i++) {
//             selectedImages.add(File(xfilePick[i].path));
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
//               const SnackBar(content: Text('Nothing is selected')));
//         }
//       },
//     );
//   }
// }

// ListView.builder(
//     itemCount: titles.length,
//     itemBuilder: (context, index) {
//       return Card(
//         elevation: 4,
//         margin: EdgeInsets.all(10),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10)),
//         child: Container(
//           margin: EdgeInsets.all(40),
//           height: 100,
//           decoration: BoxDecoration(
//             borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
//             image: DecorationImage(
//               image: NetworkImage(
//                   'https://avatars.mds.yandex.net/i?id=249e36178b607ffd447f43b052d573280e59ce0b-10355097-images-thumbs&n=13'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: ListTile(
//             leading: Image.network(
//                 'https://avatars.mds.yandex.net/i?id=249e36178b607ffd447f43b052d573280e59ce0b-10355097-images-thumbs&n=13'),
//             title: Text('Title', style: TextStyle(fontSize: 20)),
//             subtitle: Text('Subtitle', style: TextStyle(fontSize: 16)),
//             trailing: Icon(Icons.arrow_forward),
//             contentPadding:
//                 EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             dense: true,
//           ),
//         ),
//       );
//     }),

// return Card(
//   child: ListTile(
//     title: Text(titles[index]),
//     leading: const Icon(Icons.access_alarm),
//   ),
// );

// class ItemList extends StatelessWidget {
//   final List<ProductItem> items;

//   const ItemList(this.items, {required Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 156,
//       child: ListView.builder(
//         itemBuilder: (context, index) => ItemCard(
//           item: items[index],
//         ),
//         itemCount: items.length,
//         scrollDirection: Axis.horizontal,
//       ),
//     );
//   }
// }
