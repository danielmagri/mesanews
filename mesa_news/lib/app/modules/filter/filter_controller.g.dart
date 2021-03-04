// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $FilterController = BindInject(
  (i) => FilterController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterController on _FilterControllerBase, Store {
  final _$filterbuttonVisibleAtom =
      Atom(name: '_FilterControllerBase.filterbuttonVisible');

  @override
  bool get filterbuttonVisible {
    _$filterbuttonVisibleAtom.reportRead();
    return super.filterbuttonVisible;
  }

  @override
  set filterbuttonVisible(bool value) {
    _$filterbuttonVisibleAtom.reportWrite(value, super.filterbuttonVisible, () {
      super.filterbuttonVisible = value;
    });
  }

  final _$dateTextAtom = Atom(name: '_FilterControllerBase.dateText');

  @override
  String get dateText {
    _$dateTextAtom.reportRead();
    return super.dateText;
  }

  @override
  set dateText(String value) {
    _$dateTextAtom.reportWrite(value, super.dateText, () {
      super.dateText = value;
    });
  }

  final _$onlyFavoritesAtom = Atom(name: '_FilterControllerBase.onlyFavorites');

  @override
  bool get onlyFavorites {
    _$onlyFavoritesAtom.reportRead();
    return super.onlyFavorites;
  }

  @override
  set onlyFavorites(bool value) {
    _$onlyFavoritesAtom.reportWrite(value, super.onlyFavorites, () {
      super.onlyFavorites = value;
    });
  }

  final _$_FilterControllerBaseActionController =
      ActionController(name: '_FilterControllerBase');

  @override
  void start(FilterModel value) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.start');
    try {
      return super.start(value);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime date) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.setDate');
    try {
      return super.setDate(date);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnlyFavorites(bool value) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.setOnlyFavorites');
    try {
      return super.setOnlyFavorites(value);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filterbuttonVisible: ${filterbuttonVisible},
dateText: ${dateText},
onlyFavorites: ${onlyFavorites}
    ''';
  }
}
