import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/info.dart';
import 'package:whatsapp_ui/screens/archive_screen.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                children: [
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

                return InkWell(
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

              }),
            ),
          ),
          const Divider(
            color: dividerColor,
            thickness: 5,
            indent: 85,
          )
        ],
      ),
    );
  }
}
