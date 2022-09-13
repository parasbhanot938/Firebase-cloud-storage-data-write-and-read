import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataShown extends StatefulWidget {
  List? UpdatedMap;
   DataShown({Key? key,this.UpdatedMap}) : super(key: key);

  @override
  State<DataShown> createState() => _DataShownState();
}

class _DataShownState extends State<DataShown> {
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
            itemCount: widget.UpdatedMap!.length,
            itemBuilder: (BuildContext context, int index) {
              return widget.UpdatedMap![index]["value"]==true?Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text("${widget.UpdatedMap![index]["name"]}"),
              ):
              SizedBox();

            },
          ),
        ],
      ),
    );
  }
}
