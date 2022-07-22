import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_share/social_share.dart';

///
/// @date: 2022/4/21 10:44
/// @author: Sensi
/// @remark:
///
class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Share Demo')),
        body: ListView(
          children: [
            ListTile(
                title: const Text('Share facebook'),
                onTap: () async {
                  final file = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  // final file = await File('${directory.path}/temp.png').create();
                  // await file.writeAsBytes(image);
                  //
                  log('${DateTime.now()} build>>(ShareScreen:30)>>${file?.path}');
                  SocialShare.shareFacebookStory(
                          file?.path ?? '',
                          '#ffffff',
                          '#000000',
                          'https://pub.dev/packages/image_picker/install',
                          appId: '740169320311170')
                      .then((value) => log(
                          '${DateTime.now()} build>>(ShareScreen:32)>>$value'));
                },
                leading: const Icon(Icons.face)),
            ListTile(
                title: const Text('Share twitter'),
                onTap: () async {
                  SocialShare.shareTwitter(
                    "This is Social Share twitter example",
                    hashtags: ["hello", "world", "foo", "bar"],
                    url: "https://google.com/#/hello",
                    trailingText: "\nhello",
                  ).then((data) {
                    print(data);
                  });
                },
                leading: const Icon(Icons.image)),
            ListTile(
                title: const Text('Share system'),
                onTap: () async {
                  SocialShare.shareSms(
                    "This is Social Share Sms example",
                    url: "\nhttps://google.com/",
                    trailingText: "\nhello",
                  ).then((data) {
                    print(data);
                  });
                },
                leading: const Icon(Icons.image)),
            ListTile(
                title: const Text('原生share'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DemoApp()));
                })
          ],
        ));
  }
}


class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {
  String text = '';
  String subject = '';
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Plus Plugin Demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Share Plus Plugin Demo'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share text:',
                      hintText: 'Enter some text and/or link to share',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      text = value;
                    }),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share subject:',
                      hintText: 'Enter subject to share (optional)',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      subject = value;
                    }),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  // ImagePreviews(imagePaths, onDelete: _onDeleteImage),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add image'),
                    onTap: () async {
                      final imagePicker = ImagePicker();
                      final pickedFile = await imagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          imagePaths.add(pickedFile.path);
                        });
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: text.isEmpty && imagePaths.isEmpty
                            ? null
                            : () => _onShare(context),
                        child: const Text('Share'),
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: text.isEmpty && imagePaths.isEmpty
                            ? null
                            : () => _onShareWithResult(context),
                        child: const Text('Share With Result'),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _onDeleteImage(int position) {
    setState(() {
      imagePaths.removeAt(position);
    });
  }

  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }

  void _onShareWithResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    ShareResult result;
    if (imagePaths.isNotEmpty) {
      result = await Share.shareFilesWithResult(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      result = await Share.shareWithResult(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Share result: ${result.status}"),
    ));
  }
}