import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../resources/colors.dart';
import '../resources/constants.dart';
import '../resources/enum.dart';
import 'app_button.dart';

class DialogChoiceView extends StatelessWidget {
  const DialogChoiceView({
    super.key,
    this.icon = FontAwesomeIcons.question,
    required this.message,
    required this.onOk,
    this.onCancel,
    this.okText = "OK",
    this.cancelText = 'Cancel',
  });

  final IconData icon;
  final String message;
  final void Function() onOk;
  final void Function()? onCancel;

  final String okText;
  final String? cancelText;

  @override
  build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 80.0,
        // height: 500.0,
        child: Material(
          borderRadius: BorderRadius.circular(12.0),
          type: MaterialType.transparency,
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: stateIcon(icon),
              ),
              h10,

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12.0,
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(),
                ),
              ),

              //* Vertical Spacer
              hc(h: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cancelText != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SizedBox(
                            height: 40.0,
                            child: AppButton(
                              type: AppButtonType.outline,
                              text: cancelText ?? 'Cancel',
                              onPressed: onCancel ?? () {},
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SizedBox(
                      height: 40.0,
                      child: AppButton(
                        type: AppButtonType.primary,
                        text: okText,
                        onPressed: onOk,
                      ),
                    ),
                  ),
                ],
              ),

              //* Vertical Spacer
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget stateIcon(IconData data) {
    return CircleAvatar(
      backgroundColor: Palette.primary.withOpacity(0.2),
      radius: 100,
      child: CircleAvatar(
        backgroundColor: Palette.primary.withOpacity(0.2),
        radius: 70,
        child: Icon(
          data,
          color: Colors.white.withOpacity(0.7),
          size: 60,
        ),
      ),
    );
  }
}
