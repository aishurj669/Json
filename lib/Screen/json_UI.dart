import 'package:flutter/material.dart';
import 'package:jsonexample/Model/json_model.dart';
import 'package:jsonexample/Services/json_API.dart';

class Json extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return Json_Session();
  }

}

class Json_Session extends State<Json> {
Service service = new Service();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
      ),
      body: FutureBuilder(
        future: service.fetchEmployee(),
        builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
          if (snapshot.hasData) {
            List<Employee> posts = snapshot.data;

            return ListView(
              children: posts
                  .map(
                    (Employee post) => ListTile(
                      title: Text(post.name),
                      subtitle: Text(post.email),
                      leading: Text("${post.id}"),
                      trailing: Column(
                        children: <Widget>[
                          Text("city:${post.address.city}"),
                          Text("street:${post.address.street}"),
                        ]
                      ),
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
