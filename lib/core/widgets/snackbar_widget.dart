import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  String title, subTitle;
  Color borderColor;
  IconData icon;
  SnackBarWidget({
    required this.subTitle,
    required this.title,
    required this.borderColor,
    required this.icon,
    super.key,
  });

  SnackBarWidget.success({
    super.key,
    required this.subTitle,
  })  : borderColor = Colors.green,
        icon = Icons.done_outline_outlined,
        title = 'Success';

  SnackBarWidget.error({
    super.key,
    required this.subTitle,
  })  : borderColor = Colors.red,
        icon = Icons.error_outline_outlined,
        title = 'Error';

  SnackBarWidget.warning({
    super.key,
    required this.subTitle,
  })  : borderColor = Colors.orange,
        icon = Icons.warning_outlined,
        title = 'Warning';

  SnackBarWidget.info({
    super.key,
    required this.subTitle,
  })  : borderColor = Colors.blue,
        icon = Icons.info_outlined,
        title = 'Information';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(13)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: borderColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                    color: borderColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            subTitle,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
