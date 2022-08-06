import 'package:get/get.dart';

import '../data/repositories/system_repository.dart';

class SystemController extends GetxController {
  final SystemRepository repository;
  SystemController(this.repository);

  Future init() async {
    await Future.wait([]);
  }
}
