import 'package:trihai_admin_app/src/data/models/entities/customer_entity.dart';

import '../models/entities/order_entity.dart';
import '../models/responses/list_with_total_response.dart';
import '../providers/api_client.dart';

class CustomerRepository {
  final ApiClient _apiClient;

  CustomerRepository(this._apiClient);

  Future<CustomerEntity> getCustomerProfile(String id) =>
      _apiClient.getCustomerProfile(id);

  Future<ListWithTotalResponse<OrderEntity>> getCustomerOrders(
    String customerId, {
    int page = 1,
  }) =>
      _apiClient.getOrders(customerId: customerId, page: page);

  Future<ListWithTotalResponse<OrderEntity>> getOrders({
    int page = 1,
  }) =>
      _apiClient.getOrders(page: page);
}
