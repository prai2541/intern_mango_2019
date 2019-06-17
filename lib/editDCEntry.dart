import 'dart:io';
import 'package:badges/badges.dart';
import 'package:app_ui/dc_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';

class EditDCEntryL extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditDCEntry(),
    );
  }
}

class EditDCEntry extends StatefulWidget {

  @override
  EditDCEntryState createState() => EditDCEntryState();
}

class EditDCEntryState extends State<EditDCEntry> {
  File picUrl;
  List<ListWork> list = [];
  ListWork help = new ListWork(
      0, false, false, TextEditingController(), TextEditingController());
  int radioval1 = 0;
  int radioval2 = 1;
  bool price1 = false;
  bool price2 = false;
  TextEditingController captionctrl1 = TextEditingController();
  TextEditingController locationctrl1 = TextEditingController();
  TextEditingController captionctrl2 = TextEditingController();
  TextEditingController locationctrl2 = TextEditingController();
  var paytext;
  File img1;
  File img2;
                    
  //list.add(help);

  // Widget pictureETC() {
  //   ListWork help = new ListWork(
  //       0, false, false, TextEditingController(), TextEditingController());
  //   list.add(help);

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       SizedBox(
  //         height: 40,
  //       ),
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: <Widget>[
  //           caption(),
  //           SizedBox(
  //             width: 15,
  //           ),
  //           Expanded(
  //             child: TextFormField(
  //               controller: help.captionCtrl,
  //               maxLines: null,
  //               keyboardType: TextInputType.multiline,
  //               style: TextStyle(fontSize: 20),
  //               decoration: InputDecoration(
  //                   hintText: 'Write a Caption',
  //                   hintStyle: TextStyle(fontSize: 20)),
  //             ),
  //           )
  //         ],
  //       ),
  //       SizedBox(
  //         height: 30,
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Radio(
  //               value: 0,
  //               groupValue: help.radioval,
  //               onChanged: (value) {
  //                 setState(() {
  //                   help.radioval = value;
  //                 });
  //               }),
  //           Text(
  //             'Work     ',
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           Radio(
  //               value: 1,
  //               groupValue: help.radioval,
  //               onChanged: (value) {
  //                 setState(() {
  //                   help.radioval = value;
  //                 });
  //               }),
  //           Text(
  //             'People     ',
  //             style: TextStyle(fontSize: 20),
  //           )
  //         ],
  //       ),
  //       SizedBox(
  //         height: 30,
  //       ),
  //       Text(
  //         'ค่าแรง',
  //         style: TextStyle(fontSize: 30, fontFamily: 'Calibri'),
  //       ),
  //       SizedBox(
  //         height: 20,
  //       ),
  //       Row(children: <Widget>[
  //         Checkbox(
  //           value: help.pay1,
  //           onChanged: (value) {
  //             setState(() {
  //               help.pay1 = value;
  //             });
  //           },
  //         ),
  //         Text(
  //           '   ค่าแรงที่ 1',
  //           style: TextStyle(fontSize: 20),
  //         )
  //       ]),
  //       Row(children: <Widget>[
  //         Checkbox(
  //           value: help.pay2,
  //           onChanged: (value) {
  //             setState(() {
  //               help.pay2 = value;
  //             });
  //           },
  //         ),
  //         Text(
  //           '   ค่าแรงที่ 2',
  //           style: TextStyle(fontSize: 20),
  //         )
  //       ]),
  //       SizedBox(
  //         height: 30,
  //       ),
  //       TextFormField(
  //         controller: help.locationCtrl,
  //         decoration: InputDecoration(
  //             prefixIcon: Icon(
  //               Icons.location_on,
  //               color: Colors.red,
  //             ),
  //             hintText: 'Enter location'),
  //       ),
  //     ],
  //   );
  // }

  Widget caption1() {
    if(img1 == null) {
       return GestureDetector(
        onTap: getImage1,
        child: Badge(
          elevation: 5,
          badgeColor: Colors.white,
      
      position: BadgePosition.bottomRight(bottom: -15, right: -10),
      padding: EdgeInsets.all(5),
      badgeContent: Icon(Icons.add_a_photo, color: Colors.black,),
      child: Container(
        padding: EdgeInsets.only(top:5, bottom: 20, left: 5, right: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start ,
            children: [
              Icon(Icons.insert_photo,
                size: 100,
                color: Colors.grey,
              ),
              Text('Add a photo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.grey),)
            ]
          )
        )
      ));
    } else {
      return GestureDetector(
        onTap: getImage1,
        child: Badge(
          elevation: 5,
          badgeColor: Colors.white,
      
      position: BadgePosition.bottomRight(bottom: -15, right: -10),
      padding: EdgeInsets.all(5),
      badgeContent: Icon(Icons.edit, color: Colors.black,),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.file(img1, fit: BoxFit.contain, height: 150),
        )
      ));

    }
  }

  Widget caption2() {
    if(img2 == null) {
       return GestureDetector(
        onTap: getImage2,
        child: Badge(
          elevation: 5,
          badgeColor: Colors.white,
      
      position: BadgePosition.bottomRight(bottom: -15, right: -10),
      padding: EdgeInsets.all(5),
      badgeContent: Icon(Icons.add_a_photo, color: Colors.black,),
      child: Container(
        padding: EdgeInsets.only(top:5, bottom: 20, left: 5, right: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start ,
            children: [
              Icon(Icons.insert_photo,
                size: 100,
                color: Colors.grey,
              ),
              Text('Add a photo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.grey),)
            ]
          )
        )
      ));
    } else {
      return GestureDetector(
        onTap: getImage2,
        child: Badge(
          elevation: 5,
          badgeColor: Colors.white,
      
      position: BadgePosition.bottomRight(bottom: -15, right: -10),
      padding: EdgeInsets.all(5),
      badgeContent: Icon(Icons.edit, color: Colors.black,),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.file(img2, fit: BoxFit.contain, height: 140),
        )
      ));

    }
  }

  Future getImage1() async {
    var img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img == null) return;
    setState(() {
      this.img1 = img;
    });
  }
  Future getImage2() async {
    var img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img == null) return;
    setState(() {
      this.img2 = img;
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              //searchTextField.textField.controller.text = '';
              //key.currentState.clear();
            },
            child: Scaffold(
                // floatingActionButton: FloatingActionButton(
                //   child: Icon(Icons.add_a_photo),
                // ),
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  actions: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top:15, right: 20),
                      child:GestureDetector(
                        child: Text('Save', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
                        onTap: () {
                      Navigator.of(context).pop();
                        },
                      )
                    )
                  ],
                ),
                body: Container(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: ListView(
                      children: <Widget>[
                      
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                caption1(),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: captionctrl1,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                        hintText: 'Write a Caption',
                                        hintStyle: TextStyle(fontSize: 20)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Radio(
                                    value: 0,
                                    groupValue: radioval2,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   radioval1 = value;
                                      // });
                                    }),
                                Text(
                                  'Work     ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Radio(
                                    value: 1,
                                    groupValue: radioval2,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   radioval1 = value;
                                      // });
                                    }),
                                Text(
                                  'People     ',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                caption2(),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: captionctrl2,
                                    maxLines: null,
                                    keyboardType: TextInputType.multiline,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                        hintText: 'Write a Caption',
                                        hintStyle: TextStyle(fontSize: 20)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Radio(
                                    value: 0,
                                    groupValue: radioval1,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   radioval1 = value;
                                      // });
                                    }),
                                Text(
                                  'Work     ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Radio(
                                    value: 1,
                                    groupValue: radioval1,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   radioval1 = value;
                                      // });
                                    }),
                                Text(
                                  'People     ',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            paytext = Text(
                              'ค่าแรง',
                              style: TextStyle(
                                  fontSize: 30,),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(children: <Widget>[
                              Checkbox(
                                value: price1,
                                onChanged: (value) {
                                  setState(() {
                                    price1= value;
                                  });
                                },
                              ),
                              Text(
                                '   ค่าแรงที่ 1',
                                style: TextStyle(fontSize: 20),
                              )
                            ]),
                            Row(children: <Widget>[
                              Checkbox(
                                value: price2,
                                onChanged: (value) {
                                  setState(() {
                                    price2 = value;
                                  });
                                },
                              ),
                              Text(
                                '   ค่าแรงที่ 2',
                                style: TextStyle(fontSize: 20),
                              )
                            ]),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: locationctrl1,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                  ),
                                  hintText: 'Enter location',
                                  hintStyle: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(height: 40,)
                          ],
                        )]
                    )
                )
            )
        )
      ]
    );
  }
}
                    
      
 
class ListWork {
  int radioval;
  bool pay1;
  bool pay2;
  TextEditingController captionCtrl;
  TextEditingController locationCtrl;

  ListWork(
      this.radioval, this.pay1, this.pay2, this.captionCtrl, this.locationCtrl);
}
