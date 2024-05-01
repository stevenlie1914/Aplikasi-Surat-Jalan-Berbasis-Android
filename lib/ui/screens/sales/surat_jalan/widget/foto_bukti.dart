// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/app_style.dart';
import '../../../../widgets/primary_button.dart';

class FotoBukti extends StatefulWidget {
  const FotoBukti({Key? key}) : super(key: key);

  @override
  State<FotoBukti> createState() => _FotoBuktiState();
}

class _FotoBuktiState extends State<FotoBukti> {
  File? image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {
      this.image = imageTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          thickness: 5,
          color: AppStyle.lightGreyColor,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/ic_gallery.png"),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Bukti Foto",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              if (image == null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 22,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppStyle.lightGreyColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icons/ic_gallery_2x.png",
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      const Text(
                        "No Photo",
                        style: TextStyle(
                          color: AppStyle.greyColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              if (image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    children: [
                      Image.file(
                        File(image!.path),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: CircleAvatar(
                          backgroundColor: AppStyle.redColor,
                          radius: 10,
                          child: FittedBox(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  image = null;
                                });
                              },
                              icon: const Icon(
                                Icons.close,
                                color: AppStyle.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: "Camera",
                      onPressed: () => pickImage(ImageSource.camera),
                      bgColor: AppStyle.lightGreyColor,
                      textColor: AppStyle.blackColor,
                      icon: "assets/icons/ic_camera.png",
                      iconColor: AppStyle.blackColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: PrimaryButton(
                      label: "Gallery",
                      onPressed: () => pickImage(ImageSource.gallery),
                      bgColor: AppStyle.lightGreyColor,
                      textColor: AppStyle.blackColor,
                      icon: "assets/icons/ic_gallery.png",
                      iconColor: AppStyle.blackColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
