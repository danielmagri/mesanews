import 'package:flutter/widgets.dart' show Widget;
import 'package:mobx/mobx.dart';

import '../../dio/model/failure.dart';

part 'shimmer_state_model.g.dart';

enum StateType { INITIAL, SUCCESS, ERROR }

typedef Initial = Widget Function();
typedef Success<T> = Widget Function(T data);
typedef SuccessLoadable<T> = Widget Function(T data, bool loading);
typedef Error = Widget Function(Failure error);

class ShimmerState<T> = _ShimmerStateBase<T> with _$ShimmerState;

abstract class _ShimmerStateBase<T> with Store {
  @observable
  StateType _state = StateType.INITIAL;

  @observable
  bool _reloading = false;

  @computed
  bool get isLoading => _reloading;

  StateType get state => _state;

  T _data;
  T get data => _data;

  Failure _error;
  Failure get error => _error;

  @action
  void setInitial() {
    _state = StateType.INITIAL;
    _reloading = false;
  }

  @action
  // ignore: avoid_positional_boolean_parameters
  void setReloading([bool loading = true]) {
    _state = StateType.SUCCESS;
    _reloading = loading;
  }

  @action
  void setData(T data) {
    _state = StateType.SUCCESS;
    _reloading = false;
    _data = data;
  }

  @action
  void setError(Failure error) {
    _state = StateType.ERROR;
    _reloading = false;
    _error = error;
  }

  Widget handleState(Initial initial, Success<T> success, Error error) {
    switch (_state) {
      case StateType.INITIAL:
        return initial();
      case StateType.ERROR:
        return error(_error);
      default:
        return success(_data);
    }
  }

  Widget handleStateLoadable(Initial initial, SuccessLoadable<T> successLoadable, Error error) {
    switch (_state) {
      case StateType.INITIAL:
        return initial();
      case StateType.ERROR:
        return error(_error);
      default:
        return successLoadable(_data, _reloading);
    }
  }
}
