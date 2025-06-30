import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

Future<MultipartFile> uploadImageToAPI(XFile imagePicker) async {
  final mimeType = lookupMimeType(imagePicker.path) ?? 'image/jpeg';
  return await MultipartFile.fromFile(
    imagePicker.path,
    filename: imagePicker.name,
    contentType: MediaType.parse(mimeType),
  );
}
