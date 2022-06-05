import 'package:get/get.dart';
import 'package:trihai_admin_app/src/data/models/entities/customer_entity.dart';
import 'package:trihai_admin_app/src/data/repositories/customer_repository.dart';

import '../../../data/models/entities/order_entity.dart';
import '../../../data/models/enums/load_status.dart';
import '../../../data/models/responses/list_with_total_response.dart';

class PointHistoryController extends GetxController {
  final CustomerRepository _customerRepo;
  final CustomerEntity customer;
  PointHistoryController(this.customer, this._customerRepo);

  // Arguments
  var _data = ListWithTotalResponse<OrderEntity>();
  ListWithTotalResponse<OrderEntity> get data => _data;

  int _currentPage = 1;
  final query = ''.obs;
  final _loadStatus = LoadStatus.initial.obs;
  LoadStatus get loadStatus => _loadStatus.value;
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

  Future _loadData({int page = 1}) async {
    final res = await _customerRepo.getCustomerOrders(
      customer.id,
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
