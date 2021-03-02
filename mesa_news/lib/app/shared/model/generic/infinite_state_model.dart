import 'package:flutter/material.dart' show Widget, required;
import 'package:mobx/mobx.dart';
import 'package:tuple/tuple.dart';

import '../../dio/model/result.dart';

part 'infinite_state_model.g.dart';

typedef _Request<T> = Future<Result<Tuple2<int, List<T>>>> Function(int currentPage, int perPage);
typedef _ShimmerItemWidget = Widget Function();
typedef _ItemWidget<T> = Widget Function(T data);

class InfiniteState<T> = _InfiniteStateBase<T> with _$InfiniteState;

abstract class _InfiniteStateBase<T> with Store {
  ObservableList<T> data = ObservableList();

  @observable
  bool isOver = false;

  @observable
  bool isLoading = false;

  int currentPage;
  int perPage;
  int totalItems;

  _Request<T> _request;

  /// Retornar um Tuple2 contendo o 'totalPages' e a lista do conteúdo, respectivamente.
  /// (Por conta da filtragem o totalPages pode variar)
  void requestFunction(_Request<T> request) => _request = request;

  _InfiniteStateBase({@required this.perPage, this.currentPage = 1});

  @action
  Future requestMoreItems() async {
    if (!isOver && !isLoading) {
      isLoading = true;
      (await _request(currentPage, perPage)).result((data) {
        totalItems = data.item1;
        this.data.addAll(data.item2);

        checkHasOver();
        currentPage++;
        isLoading = false;
      }, (error) {
        isLoading = false;

        checkHasOver();
      });
    }
  }

  @computed
  int get length {
    int length = data.length;

    if (isLoading && data.isEmpty) {
      length += 2;
    } else if (!isOver || isLoading) {
      length += 1;
    }

    return length;
  }

  Widget widgetBuilder({int index, _ShimmerItemWidget shimmerItem, _ItemWidget<T> item}) {
    if (index >= data.length || data.isEmpty) {
      return shimmerItem();
    } else {
      return item(data[index]);
    }
  }

  @action
  bool checkHasOver() {
    isOver = (currentPage * perPage >= totalItems);
    return isOver;
  }

  @action
  void resetDataAndRequest() {
    isOver = false;
    totalItems = 0;
    currentPage = 1;
    data.clear();
    requestMoreItems();
  }
}
