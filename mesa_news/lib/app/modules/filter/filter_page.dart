import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mesa_news/app/modules/home/model/filter_model.dart';
import 'package:mesa_news/app/shared/utils/app_colors.dart';
import 'filter_controller.dart';

class FilterPage extends StatefulWidget {
  final FilterModel filter;
  const FilterPage({Key key, this.filter}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends ModularState<FilterPage, FilterController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.start(widget.filter);
    super.initState();
  }

  void clear() {
    Modular.to.pop(FilterModel());
  }

  void setFilter() {
    Modular.to.pop(controller.filter);
  }

  void selectDate() {
    showDatePicker(
        context: context,
        initialDate: controller.filter.date ?? DateTime.now(),
        firstDate: DateTime(2018, 1, 1),
        lastDate: DateTime.now(),
        helpText: "Selecione uma data",
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.PRIMARY_COLOR,
                  surface: AppColors.PRIMARY_COLOR,
                ),
              ),
              child: child);
        }).then(controller.setDate);
  }

  @override
  Widget build(_) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_GRAY,
      appBar: AppBar(
        elevation: 0,
        title: Text("Filtro", style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: clear,
              child: const Text("Limpar", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)))
        ],
      ),
      bottomNavigationBar: Observer(builder: (_) {
        return Visibility(
          visible: controller.filterbuttonVisible,
          child: Container(
            color: AppColors.PRIMARY_COLOR,
            height: 60,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: setFilter,
                splashColor: Colors.white24,
                child: Center(
                    child: const Text("Filtrar",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white))),
              ),
            ),
          ),
        );
      }),
      body: Column(
        children: [
          const SizedBox(height: 24),
          ListTile(
            title: const Text("Data", style: TextStyle(fontSize: 17, color: Colors.black)),
            visualDensity: VisualDensity.compact,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(
                  builder: (_) => Text(controller.dateText,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, color: Colors.black)),
                ),
                const SizedBox(width: 27),
                Icon(Icons.arrow_forward_ios, color: AppColors.ARROW_COLOR, size: 13),
              ],
            ),
            onTap: selectDate,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: const Divider(),
          ),
        ],
      ),
    );
  }
}
