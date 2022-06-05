import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trihai_admin_app/src/constants/assets.dart';
import 'package:trihai_admin_app/src/data/models/enums/load_status.dart';
import 'package:trihai_admin_app/src/ui/widgets/common/h_network_image.dart';
import 'package:trihai_admin_app/src/ui/widgets/indicators/loading_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:trihai_admin_app/src/ui/widgets/app_bars/back_app_bar.dart';
import 'package:trihai_admin_app/src/ui/widgets/common/primary_scaffold.dart';

import '../../../../generated/l10n.dart';
import 'qr_scanner_controller.dart';

class QrScannerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<QrScannerController>(QrScannerController(Get.find()));
  }
}

class QrScannerPage extends StatefulWidget {
  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  late final QrScannerController controller;
  late final ScannerController _scannerController;

  @override
  void initState() {
    super.initState();
    controller = Get.find<QrScannerController>();

    _scannerController = ScannerController(
      scannerResult: (r) async {
        if (r != controller.scanResult.value) {
          await controller.onChangeScanResult(r);
        }
        _scannerController.startCameraPreview();
      },
      scannerViewCreated: () {
        controller.loadStatus.value = LoadStatus.loading;
        TargetPlatform platform = Theme.of(context).platform;
        if (TargetPlatform.iOS == platform) {
          Future.delayed(Duration(seconds: 1), () {
            _scannerController.startCamera();
            _scannerController.startCameraPreview();
            controller.loadStatus.value = LoadStatus.success;
          });
        } else {
          _scannerController.startCamera();
          _scannerController.startCameraPreview();
          controller.loadStatus.value = LoadStatus.success;
        }
        controller.reScan();
      },
    );
  }

  @override
  void dispose() {
    _scannerController.stopCameraPreview();
    _scannerController.stopCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      backgroundColor: context.colorScheme.primary,
      appBar: BackAppBar(
        backgroundColor: context.colorScheme.primary,
        title: S.current.scanQrCode,
        textColor: context.colorScheme.onPrimary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black26,
                      ),
                      width: Get.width - 40,
                      height: Get.height - 300,
                      child: PlatformAiBarcodeScannerWidget(
                        platformScannerController: _scannerController,
                        unsupportedDescription: S.current.unknownError,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            40.heightBox,
            Obx(
              () => Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.colorScheme.background,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: CustomNetworkImage(
                        controller.customer.value?.avatarUrl,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          (controller.customer.value?.fullName ??
                                  S.current.customer)
                              .text
                              .bodyText1(context)
                              .bold
                              .make(),
                          10.heightBox,
                          (controller.customer.value?.phone ?? '').text.make(),
                        ],
                      ),
                    ),
                    controller.loadStatus.value.isLoading
                        ? LoadingIndicator()
                        : SvgPicture.asset(
                            Assets.icons.arrowRight,
                            color: controller.customer.value != null
                                ? null
                                : context.colorScheme.surface,
                          ),
                    10.widthBox,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
