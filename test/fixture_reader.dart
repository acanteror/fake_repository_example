import 'dart:io';

String fixture(String path) {
  try {
    return File('../$path').readAsStringSync();
  } catch (e) {
    return File('./$path').readAsStringSync();
  }
}
