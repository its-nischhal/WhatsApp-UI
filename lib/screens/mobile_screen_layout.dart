import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_ui/screens/search_screen.dart';
import 'package:whatsapp_ui/widgets/contact_list.dart';

import '../info.dart';
import 'archive_screen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:const Text(
            'Whatsapp',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return SearchScreen();}));
          }, icon: Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Chat'),),
              Tab(child: Text('Status'),),
              Tab(child: Text('Call'),)
            ],

          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){return ArchiveScreen();}));
                  },

                  child: Row(
                    children: const [
                      Icon(Icons.archive,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text(
                        'Archived',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Scrollbar(
                  // thumbVisibility: true,
                  thickness: 3,
                  child: ListView.builder(
                      itemCount: info.length,
                      itemBuilder: (context,index) {
                        if(info[index]['isArchived']==false){
                          return InkWell(
                            onLongPress: (){
                              setState(() {
                                info[index]['isArchived']=true;
                              });
                            },
                            onTap: (){},
                            child: ListTile(

                              title: Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(info[index]['name'].toString(),style: TextStyle(fontSize: 18.0),),
                              ),
                              leading: CircleAvatar(backgroundImage: NetworkImage(info[index]['profilePic'].toString()), radius: 25,),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Text(info[index]['message'].toString() , style: TextStyle(fontSize: 15.0, color: Colors.grey),),
                              ),
                              trailing: Text(info[index]['time'].toString(), style: TextStyle(color: Colors.grey,fontSize: 13,),),
                            ),
                          );
                        }
                        else{
                          return Container();
                        }

                      }),
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}

