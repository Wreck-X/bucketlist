import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';
import '../utils/constants.dart';
import '../models/statusUpdates/statusUpdates.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<StatusUpdates> statusupdates(ref) async {
  final response =
      await http.get(Uri.http('django-beacon.vercel.app', '/updates'));

  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return StatusUpdates.fromJson(json);
}
