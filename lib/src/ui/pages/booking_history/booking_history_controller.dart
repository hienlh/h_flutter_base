import 'package:get/get.dart';
import 'package:trihai_admin_app/src/data/repositories/customer_repository.dart';
import 'package:trihai_admin_app/src/routes.dart';
import 'package:trihai_admin_app/src/ui/pages/customer_profile/customer_profile_page.dart';

import '../../../data/models/entities/order_entity.dart';
import '../../../data/models/enums/load_status.dart';
import '../../../data/models/responses/list_with_total_response.dart';

class BookingHistoryController extends GetxController {
  final CustomerRepository _customerRepo;
  BookingHistoryController(this._customerRepo);

  // Arguments
  var _data = ListWithTotalResponse<OrderEntity>();
  ListWithTotalResponse<OrderEntity> get data => _data;

  int _currentPage = 1;
  final query = ''.obs;
  final _loadStatus = LoadStatus.initial.obs;
  LoadStatus get loadStatus => _loadStatus.value;
  final _loadCustomerStatus = LoadStatus.initial.obs;
  LoadStatus get loadCustomerStatus => _loadCustomerStatus.value;
  // ----------------

  Future onRefresh() async {
    await Future.wait([
      _loadData(),
    ]);
  }

  Future loadMore() async {
    if (loadStatus == LoadStatus.loadingMore || data.isLastPage) return;
    try {
      _loadStatus.value = LoadStatus.loadingMore;
      await _loadData(page: _currentPage + 1);
      _loadStatus.value = LoadStatus.success;
    } catch (e) {
      _loadStatus.value = LoadStatus.failure;
      rethrow;
    }
  }

  Future loadData() async {
    try {
      _loadStatus.value = LoadStatus.loading;
      await _loadData();
      _loadStatus.value = LoadStatus.success;
    } catch (e) {
      _loadStatus.value = LoadStatus.failure;
      rethrow;
    }
  }

  Future goToCustomerPage(String customerId) async {
    try {
      _loadCustomerStatus.value = LoadStatus.loading;
      final customer = await _customerRepo.getCustomerProfile(customerId);
      _loadCustomerStatus.value = LoadStatus.success;

      Get.toNamed(Routes.customerProfile,
          arguments: CustomerProfileArgs(customer));
    } catch (e) {
      _loadCustomerStatus.value = LoadStatus.failure;
      rethrow;
    }
  }

  Future _loadData({int page = 1}) async {
    final res = await _customerRepo.getOrders(
      page: page,
    );
    _currentPage = page;

    if (page == 1) {
      _data.items.clear();
    }
    _data = data.copyWith(
      items: data.items..addAll(res.items),
      totalCount: res.totalCount,
    );
    update();
  }
}
