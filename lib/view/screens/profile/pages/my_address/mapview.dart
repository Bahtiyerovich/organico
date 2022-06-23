import 'package:flutter/material.dart';
import 'package:organico/core/base/base_view.dart';

class MapViewPage extends StatelessWidget {
  const MapViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: MapViewPage,
        onPageBuilder: (context, widget) {
          return Scaffold(
            
          );
        });
  }
}
