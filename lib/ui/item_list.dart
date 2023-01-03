import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../validator/database.dart';
import 'edit_screen.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: DataBase.readItems(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return const Text('Something is went Wrong');
        }
        else if(snapshot.hasData){
          return ListView.separated(
            separatorBuilder: (context,index)=> const SizedBox(height: 16,),
              itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,index){
              var noteInfo = snapshot.data!.docs[index].data() as Map<String,dynamic>;
              String docId = snapshot.data!.docs[index].id;
              String description = noteInfo['description'];
              String title = noteInfo['title'];

              return Ink(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditScreen(
                        currentTitle: title,
                        currentDescription: description,
                        documentId: docId
                      )
                    ));
                  },
                  title: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  subtitle: Text(description,maxLines: 1,overflow: TextOverflow.ellipsis,),
                ),
              );
            },

          );
        }
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
          ),
        );
      },
    );
  }
}
