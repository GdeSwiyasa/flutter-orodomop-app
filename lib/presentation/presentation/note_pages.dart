import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orodomop_app/common/constant.dart';

class NotePages extends StatelessWidget {
  static const routeName = 'note_page';

  const NotePages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        centerTitle: true,
        title: const Text('NOTE'),
        backgroundColor: whiteColor,
        foregroundColor: blackColor,
        elevation: 0,
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                padding:
                    EdgeInsets.only(top: 8, right: 24, left: 24, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Jadwal mata pelajaran'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 8,
          padding: EdgeInsets.all(16),
          separatorBuilder: (context, index) => Divider(height: 16),
        ),
      ),
    );
  }
}
