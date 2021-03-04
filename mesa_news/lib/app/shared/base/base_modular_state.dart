import 'package:flutter/material.dart' show Colors, Navigator, SizedBox, StatefulWidget, Widget, protected, showDialog;
import 'package:flutter_modular/flutter_modular.dart' show ModularState;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mesa_news/app/shared/dio/model/failure.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';
import 'package:mesa_news/app/shared/widget/loading.dart';
import 'package:mobx/mobx.dart';

abstract class BaseModularState<TWidget extends StatefulWidget, TBind> extends ModularState<TWidget, TBind> {
  List<ReactionDisposer> disposers = [];
  bool _isLoading = false;

  @protected
  void showToast(String message, {bool isError = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: isError ? Colors.red : AppColors.PRIMARY_COLOR,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @protected
  void handleLoading(bool loading) {
    if (!_isLoading && loading) {
      _isLoading = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        child: Loading(),
      );
    } else if (_isLoading && !loading) {
      _isLoading = false;
      Navigator.of(context).pop();
    }
  }

  Widget handleError(Failure error, {Widget child}) {
    showToast(error.message, isError: true);
    return child ?? const SizedBox();
  }

  @override
  void dispose() {
    disposers?.map((d) => d());
    super.dispose();
  }
}
