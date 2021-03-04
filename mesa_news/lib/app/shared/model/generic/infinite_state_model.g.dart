// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infinite_state_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InfiniteState<T> on _InfiniteStateBase<T>, Store {
  Computed<int> _$lengthComputed;

  @override
  int get length => (_$lengthComputed ??=
          Computed<int>(() => super.length, name: '_InfiniteStateBase.length'))
      .value;
  Computed<bool> _$listIsEmptyComputed;

  @override
  bool get listIsEmpty =>
      (_$listIsEmptyComputed ??= Computed<bool>(() => super.listIsEmpty,
              name: '_InfiniteStateBase.listIsEmpty'))
          .value;

  final _$isOverAtom = Atom(name: '_InfiniteStateBase.isOver');

  @override
  bool get isOver {
    _$isOverAtom.reportRead();
    return super.isOver;
  }

  @override
  set isOver(bool value) {
    _$isOverAtom.reportWrite(value, super.isOver, () {
      super.isOver = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_InfiniteStateBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$requestMoreItemsAsyncAction =
      AsyncAction('_InfiniteStateBase.requestMoreItems');

  @override
  Future<dynamic> requestMoreItems() {
    return _$requestMoreItemsAsyncAction.run(() => super.requestMoreItems());
  }

  final _$_InfiniteStateBaseActionController =
      ActionController(name: '_InfiniteStateBase');

  @override
  void resetDataAndRequest() {
    final _$actionInfo = _$_InfiniteStateBaseActionController.startAction(
        name: '_InfiniteStateBase.resetDataAndRequest');
    try {
      return super.resetDataAndRequest();
    } finally {
      _$_InfiniteStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOver: ${isOver},
isLoading: ${isLoading},
length: ${length},
listIsEmpty: ${listIsEmpty}
    ''';
  }
}
