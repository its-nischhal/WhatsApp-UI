import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/info.dart';
import 'mobile_screen_layout.dart';

class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
            'Archived Chats'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Expanded(
          child: Scrollbar(
            // thumbVisibility: true,
            thickness: 3,
            child: ListView.builder(
                itemCount: info.length,
                itemBuilder: (context,index) {
                  if(info[index]['isArchived']==true){
                    return InkWell(
                      onLongPress: (){
                          info[index]['isArchived']=false;
                          setState(() {

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
      ),
    );
  }
}

