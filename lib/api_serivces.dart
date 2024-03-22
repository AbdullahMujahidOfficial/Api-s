import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models.dart';

class apiServices extends StatefulWidget {
  const apiServices({super.key});

  @override
  State<apiServices> createState() => _apiServicesState();
}

class _apiServicesState extends State<apiServices> {

  List<Models> postList = [];
  Future<List<Models>> getPostApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(Models.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context,snapshot){
                if (!snapshot.hasData){
                  return Text('loading');
    }else{
                  return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          Text(postList[index].title.toString()),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Description",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          Text(postList[index].body.toString()),

                        ],
                      ),
                    ),
                  );
    }
    );
    }
                }
            ),
          )
        ],
      ),
    );
  }
}
