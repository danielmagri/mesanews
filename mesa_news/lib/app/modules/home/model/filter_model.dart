class FilterModel {
  DateTime date;
  bool onlyFavorites = false;

  String get dateFormatted => date == null
      ? null
      : "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

  String get dateBeautyFormatted => date == null
      ? "Todas"
      : "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()}";
}
