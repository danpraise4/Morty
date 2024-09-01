import 'package:cached_network_image/cached_network_image.dart';
import 'package:morty/core/resources/constants.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MediaPreview extends StatelessWidget {
  final String imagePath;

  final void Function(String)? onAccept;
  final void Function()? onClose;

  const MediaPreview({
    super.key,
    required this.imagePath,
    this.onAccept,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomRight,
          fit: StackFit.expand,
          children: [
            //* Vertical Spacer
            const SizedBox(height: 10.0),
            Builder(
              builder: (context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: (imagePath.startsWith('https://'))
                      ? CachedNetworkImage(
                          imageUrl: (imagePath),
                        )
                      : Image.file(
                          File(imagePath),
                        ),
                );
              },
            ),

            Positioned(
              bottom: 10,
              right: 12,
              child: SafeArea(
                child: Row(
                  children: [
                    if (onClose != null)
                      SizedBox.square(
                        dimension: 40,
                        child: MaterialButton(
                          color: Colors.grey.withOpacity(0.5),
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 22,
                          ),
                          onPressed: () => onClose?.call(),
                        ),
                      ),
                    w10,
                    if (onAccept != null)
                      SizedBox.square(
                        dimension: 50,
                        child: MaterialButton(
                          color: Colors.grey.withOpacity(0.5),
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 32,
                          ),
                          onPressed: () {
                            onAccept?.call(imagePath);
                            Navigator.pop(context, imagePath);
                          },
                        ),
                      )
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
