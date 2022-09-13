import 'package:flutter/cupertino.dart';
import 'package:project1/data_shown.dart';

import 'constants/export.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool state = false;

  var x;
  bool shown = true;
  TextEditingController controller = TextEditingController();

  final listController = Get.put(ListController());
  List mapp = [
    {
      "name": "Room 1",
      "value": false,
    },
    {
      "name": "Room 2",
      "value": false,
    },
    {
      "name": "Room 3",
      "value": false,
    },
    {
      "name": "Room 4",
      "value": false,
    },
    {
      "name": "Room 5",
      "value": false,
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      controller.value.text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("List"),
        ),
        body: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: mapp.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Text("${mapp[index]["name"]}"),
                    ),
                    Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        value: mapp[index]["value"],
                        onChanged: (value) {
                          mapp[index]["value"] = value;
                          setState(() {});
                        },
                        thumbColor: CupertinoColors.white,
                        activeColor: CupertinoColors.systemYellow,
                        trackColor: CupertinoColors.link,
                      ),
                    ),
                  ],
                );
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataShown(UpdatedMap:

                        mapp
                        )),
                  );
                },
                child: Text("Next"))
          ],
        ));
  }

  Widget pinkContainer() {
    return Container(
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        color: Colors.pink,
      ),
      child: IconButton(
        color: Colors.white,
        iconSize: 40,
        onPressed: () {
          shown = !shown;
          setState(() {});
        },
        icon: Icon(
          Icons.arrow_drop_down,
        ),
      ),
    );
  }

  Widget listItems() {
    return PopupMenuButton(
      child: Row(
        children: [
          Text(
            "${x.toString()}",
            style: TextStyle(fontSize: 13),
          ),
          Icon(Icons.add),
        ],
      ),
      color: Colors.white,
      elevation: 2,
      onSelected: (value) {
        x = value;

        setState(() {});
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "Item ksdf",
            child: Text(
              "Item 1",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              "Item 1",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: Text(
              "Item 1",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ];
      },
    );
  }

  Widget list() {
    return listItems();
  }
}
