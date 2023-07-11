import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resume_builder_ui/models/resume_model.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import "package:universal_html/html.dart" as html;

import 'package:url_launcher/url_launcher.dart';

class ResumeGeneratorRespository {
  Future<String?> generateResume(ResumeModel resumeModel) async {
    Dio dio = Dio();
    var options = BaseOptions(
        baseUrl: 'https://adoberesumebuilder-production.up.railway.app',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/pdf',
        },
        responseType: ResponseType.bytes);
    dio.options = options;
    try {
      var requestBody = resumeModel.toJson();
      var response = await dio.post('/resume', data: jsonEncode(requestBody));

      if (response.statusCode == 200) {
        if (kIsWeb) {
          final Uint8List pdfData = response.data as Uint8List;
          final blob = html.Blob([pdfData], 'application/pdf');
          var url = html.Url.createObjectUrlFromBlob(blob);
          await launchUrl(Uri.parse(url));
          return "Pdf is successfully opened in a new tab...👍👍";
        } else {
          Directory? directory = await getApplicationDocumentsDirectory();
          String fileName =
              "resume_${DateTime.now().millisecondsSinceEpoch}.pdf";
          String filePath = '${directory.path}/$fileName';
          File file = File(filePath);

          await file.writeAsBytes(response.data, flush: true);

          if (Platform.isWindows) {
            await launchUrl(Uri.parse(filePath));
            return "Pdf is successfully stored in $filePath";
          } else {
            await OpenFilex.open(filePath);
            return "Pdf is successfully stored in $filePath";
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
