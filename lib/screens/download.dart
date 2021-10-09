import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

class Download {
  Future<void> downloadVideo(String link, String title) async {
    final result =
        await FlutterYoutubeDownloader.downloadVideo(link, title, 18);
  }
}
