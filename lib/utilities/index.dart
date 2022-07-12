import 'dart:convert';
import 'dart:typed_data';

String convertBase64(Uint8List filedata) {
  return "data:image/png;base64,${base64.encode(filedata)}";
}
