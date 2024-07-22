import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:getx_admin_panel/core/imports/core_imports.dart';
import 'package:getx_admin_panel/views/add_purchase_voucher/add_purchase_voucher_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:web/web.dart' as web;

class ImagePickerContainer extends GetView<AddPurchaseController> {



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPurchaseController());
    return Column(
      children: [
        GestureDetector(
          onTap: controller.pickImages,
          child:Obx(() =>
          Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height*0.45,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: kcPrimaryColor, width: 2),

            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.3,
                  width: MediaQuery.sizeOf(context).width*0.8,
                  child: Stack(
                    children: [
                      DropzoneView(
                        onCreated: (DropzoneViewController ctrl) =>
                        controller.dropzoneViewController = ctrl,
                        onDrop: (dynamic ev) async {
                          // final name = await _controller.getFilename(ev);
                          // final mime = await _controller.getFileMIME(ev);
                          // final bytes = await _controller.getFileData(ev);
                          final url = await controller.dropzoneViewController. createFileUrl(ev);

                            controller.addImage(XFile(url),url);
                        },
                      ),
                      Center(
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height*0.3,
                          width: MediaQuery.sizeOf(context).width*0.8,
                          child: DottedBorder(
                            color: kcPrimaryColor,
                            strokeWidth: 2,
                            dashPattern: const [5, 5],
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            child: Center(
                              child: SvgPicture.asset(
                                AssetManager.imageUploadIcon,
                                // Add your SVG asset here
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.images.isNotEmpty)
                  Column(
                    children: [
                      const SizedBox(height: 20),

                         Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: controller.images.map((image) {
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    image.path,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () =>
                                        controller.removeImage(controller.images.indexOf(image)),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: kcRedColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: kcWhitecolor,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),

                    ],
                  ),
              ],
            ),
          ),
          ),
        ),
      ],
    );
  }
}

