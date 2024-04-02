import 'package:codealpha_flashcard_quiz_app/core/class/statusrequest.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final Widget loading;
  const HandlingDataView(
      {Key? key,
      required this.statusRequest,
      required this.widget,
      required this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? loading
        : statusRequest == StatusRequest.serverfailure
            ? const Center(
                child: Text('Error'),
              )
            : statusRequest == StatusRequest.failure
                ? const Center(child: Text('No FlashCards'))
                : widget;
  }
}
