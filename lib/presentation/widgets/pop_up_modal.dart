import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:orodomop_app/common/constant.dart';

Future<void> showPopupModal({
  required BuildContext context,
  required String title,
  void Function()? onCancel,
  void Function()? onConiform,
}) async {
  await showCupertinoDialog(
    context: context,
    builder: (_) => _PopupModal(
      title: title,
      onCancel: onCancel,
      onConiform: onConiform,
    ),
  );
}

class _PopupModal extends StatelessWidget {
  const _PopupModal({
    Key? key,
    required this.title,
    this.onCancel,
    this.onConiform,
  }) : super(key: key);

  final String title;
  final void Function()? onCancel;
  final void Function()? onConiform;

  void _cancel(BuildContext context) {
    onCancel?.call();
    Navigator.of(context).pop();
  }

  void _coniform(BuildContext context) {
    onConiform?.call();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final color = CupertinoTheme.of(context).primaryColor;

    return GestureDetector(
      onTap: () => _cancel(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: whiteColor.withOpacity(0.5),
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 20,
                  color: blackColor,
                ),
                child: Text(
                  title,
                  // style:
                  // const TextStyle(
                  //   fontSize: 20,
                  //   color: kTextColor,
                  // ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Flexible(
                    child: TextButton(
                      child: Text(
                        "Yes",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      onPressed: () {
                        _coniform(context);
                      },
                    ),
                    // child: ActionButton.withChildText(
                    //   context: context,
                    //   title: 'Yes',
                    //   onPressed: () => _coniform(context),
                    // ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: TextButton(
                      child: Text(
                        "No",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      onPressed: () {
                        _cancel(context);
                      },
                    ),
                    // child: ActionButton.withChildText(
                    //   context: context,
                    //   color: color.withOpacity(0.3),
                    //   title: 'No',
                    //   titleColor: color,
                    //   onPressed: () => _cancel(context),
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
