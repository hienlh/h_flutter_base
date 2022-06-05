import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:trihai_admin_app/src/data/models/enums/load_status.dart';
import 'package:trihai_admin_app/src/ui/widgets/app_bars/back_app_bar.dart';
import 'package:trihai_admin_app/src/ui/widgets/common/primary_scaffold.dart';
import 'package:trihai_admin_app/src/utils/app_utils.dart';
import 'package:trihai_admin_app/src/utils/load_more_mixin.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../generated/l10n.dart';
import 'booking_history_controller.dart';

class BookingHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BookingHistoryController>(
        BookingHistoryController(Get.find())..loadData());
  }
}

class BookingHistoryPage extends GetView<BookingHistoryController>
    with LoadMoreActionMixin {
  @override
  void onLoadMore() {
    controller.loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      backgroundColor: context.colorScheme.background.withOpacity(0.98),
      appBar: BackAppBar(
        backgroundColor: context.colorScheme.primary,
        textColor: context.colorScheme.onPrimary,
        title: S.current.bookingHistory,
      ),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: GetBuilder<BookingHistoryController>(
          builder: (_) {
            return ListView.separated(
              padding: EdgeInsets.all(20),
              itemCount: controller.data.items.length,
              separatorBuilder: (context, index) => 20.heightBox,
              itemBuilder: (context, index) {
                final item = controller.data.items[index];
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: context.colorScheme.background,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: context.colorScheme.surface),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildRowText(
                        context,
                        S.current.order,
                        '#${item.code ?? item.id ?? ''}',
                      ),
                      4.heightBox,
                      _buildRowText(
                        context,
                        S.current.date,
                        item.creationTime != null
                            ? DateFormat('MMM dd, yyyy')
                                .format(item.creationTime!)
                            : '',
                      ),
                      4.heightBox,
                      _buildRowText(
                        context,
                        S.current.toMoney,
                        item.totalAmount != null
                            ? AppUtils.formatCurrency(
                                item.totalAmount!.toString())
                            : '',
                      ),
                      4.heightBox,
                      Obx(
                        () => InkWell(
                          onTap: controller.loadCustomerStatus.isLoading
                              ? null
                              : () {
                                  controller
                                      .goToCustomerPage(item.customerId ?? '');
                                },
                          child: S.current.viewCustomerInformation.text
                              .underline.bold
                              .color(context.colorScheme.primary)
                              .make(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildRowText(
    BuildContext context,
    String label,
    String value, [
    bool isHighlight = false,
  ]) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 14, color: context.colorScheme.onBackground),
        children: [
          TextSpan(text: '$label: '),
          TextSpan(
            text: value,
            style: TextStyle(
              color: isHighlight
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurface,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
