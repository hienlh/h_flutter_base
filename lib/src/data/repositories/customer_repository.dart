import 'package:trihai_admin_app/src/data/models/entities/customer_entity.dart';

import '../providers/api_client.dart';

class CustomerRepository {
  final ApiClient _apiClient;

  CustomerRepository(this._apiClient);

  Future<CustomerEntity> getCustomerProfile(String id) =>
      _apiClient.getCustomerProfile(id);
}
