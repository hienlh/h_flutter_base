import 'package:get/get.dart';
import 'package:trihai_admin_app/src/data/models/entities/customer_entity.dart';
import 'package:trihai_admin_app/src/data/repositories/customer_repository.dart';
import 'package:trihai_admin_app/src/utils/app_utils.dart';

import '../../../data/models/enums/load_status.dart';

class QrScannerController extends GetxController {
  final CustomerRepository _customerRepo;

  QrScannerController(this._customerRepo);

  final scanResult = ''.obs;
  final loadStatus = LoadStatus.initial.obs;
  final customer = Rx<CustomerEntity?>(null);

  void reScan() {
    customer.value = null;
  }

  Future onChangeScanResult(String result) async {
    if (result != scanResult.value) {
      scanResult.value = result;
      await loadCustomerProfile();
    }
  }

  Future loadCustomerProfile() async {
    try {
      loadStatus.value = LoadStatus.loading;
      customer.value = await _customerRepo.getCustomerProfile(scanResult.value);
      loadStatus.value = LoadStatus.success;
    } catch (e) {
      loadStatus.value = LoadStatus.failure;
      customer.value = null;
      AppUtils.showError(e);
      rethrow;
    }
  }
}
