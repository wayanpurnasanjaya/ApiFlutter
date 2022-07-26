import 'package:flutter/material.dart';
import 'package:apiflutter/model/model_user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:apiflutter/ui_view/detail_list_user.dart';

class PageUserList extends StatefulWidget {
  const PageUserList({Key? key}) : super(key: key);

  @override
  State<PageUserList> createState() => _PageUserListState();
}

class _PageUserListState extends State<PageUserList> {
  List<ModelUsers> listModel = [];
  var loading = false;

  Future<Null> getData() async {
    setState((){
      loading = true;
    });
    final responseData = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if(responseData.statusCode == 200){
      final data = jsonDecode(responseData.body);
      setState((){
        for(Map i in data){
          listModel.add(ModelUsers.fromJson(i));
        }
        loading = false;
      });
    }
  }
  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page User List"),
      ),
      body: Container(
        child: loading ? Center(child: CircularProgressIndicator()): ListView.builder(
          itemCount:listModel.length ,
          itemBuilder: (context, i){
            final nDataList = listModel[i];
            return InkWell(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>DetaiListUser(nDataList)));
              },
              child: Container(
                child: Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nDataList.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.green),
                        ),
                        Text(nDataList.phone),
                        Text(nDataList.website),
                        Text(nDataList.company.name)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
