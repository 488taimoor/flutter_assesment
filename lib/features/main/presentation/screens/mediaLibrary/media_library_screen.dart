import 'package:flutter/cupertino.dart';

class MediaLibraryScreen extends StatefulWidget {
  const MediaLibraryScreen({Key? key}) : super(key: key);

  @override
  State<MediaLibraryScreen> createState() => _MediaLibraryScreenState();
}

class _MediaLibraryScreenState extends State<MediaLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Wellness'));
  }
}
