import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uas_mobile/models/biodata.dart';
import 'package:uas_mobile/screens/detail_bio.dart';

class BiodataCard extends StatelessWidget {
  const BiodataCard({
    super.key,
    required this.alertContext,
    required this.biodata,
    required this.deleteData,
  });

  final BuildContext alertContext;
  final Biodata biodata;
  final Function deleteData;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(8.0),
            onPressed: (context) async {
              if (await confirm(
                alertContext,
                textOK: const Text('Delete'),
                textCancel: const Text('Cancel'),
                title: const Text('Delete'),
                content: const Text('Are you sure to delete this item?'),
              )) {
                deleteData(biodata);
              }
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever_rounded,
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(8.0),
            onPressed: (context) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailBioPage(
                    biodata: biodata,
                  ),
                ),
              );
            },
            backgroundColor: const Color(0xff6777ef),
            foregroundColor: Colors.white,
            icon: Icons.remove_red_eye,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff6777ef).withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 9,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image(
                image: const AssetImage('assets/logo-filled.png'),
                width: MediaQuery.of(context).size.width / 4,
              ),
            ),
            const SizedBox(
              width: 25.0,
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0)),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      biodata.nama,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
