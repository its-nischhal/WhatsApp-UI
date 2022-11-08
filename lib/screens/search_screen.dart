import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/contact_list.dart';

import '../info.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = '@';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child:
            TextField(
              onChanged: (text){
                setState(() {
                  searchText = text;
                  if(searchText.length==0){
                    searchText='@';
                  }
                });

              },
              decoration:const InputDecoration(
                prefixIcon: Icon(
                    Icons.search
                ),
              ),

            ),
            ),

            Expanded(
              flex: 8,
              child: ListView.builder(
                  itemCount: info.length,
                  itemBuilder: (context,index) {
                    if(info[index]['name'].toString().contains(searchText)){
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

            )
          ],
        ),

      )
      ,
    );
  }
}

