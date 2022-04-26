import 'dart:convert';

import 'dart:typed_data';

class Base64 {
  Base64(_);
  static String encode(List<int> imageBytes) => base64Encode(imageBytes);
  static Uint8List decode(String stringBase64) => base64Decode(stringBase64);
}
