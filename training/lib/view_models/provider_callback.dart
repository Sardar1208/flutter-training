import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/view_models/base_model.dart';

Future providerCallback<T extends BaseModel>(BuildContext context,
    {required final Function(T) task,
    required final String Function(T) taskName,
    required Function(T) onSuccess,
    bool showDialog = true,
    bool showLoader = true,
    String? text,
    Function? onErrorHandeling,
    Function? onError}) async {
  final _provider = Provider.of<T>(context, listen: false);
  var _taskName = taskName(_provider);

  // if (showLoader) LoadingDialog().show(text: text);
  await Future.microtask(() => task(_provider));
  // if (showLoader) LoadingDialog().hide();
  print(
      'status before=====>_provider.status[_taskName]====>${_provider.status[_taskName]}');
  if (_provider.status[_taskName] == Status.Error) {
    if (showDialog) {
      print("error");
      // ErrorDialog().show(
      //   _provider.error[_taskName].toString(),
      //   context: context,
      //   onButtonPressed: onErrorHandeling,
      // );
    }

    if (onError != null) onError(_provider);

    _provider.reset(_taskName);
    print(
        'status before=====>_provider.status[_taskName]====>${_provider.status[_taskName]}');
  } else if (_provider.status[_taskName] == Status.Done) {
    onSuccess(_provider);
  }
}
