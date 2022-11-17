import 'package:flutter/material.dart';
import 'package:flutter_play/constant/widget_style.dart';
import 'package:flutter_play/page/paint_test_page.dart';
import 'package:flutter_play/page/paper_page.dart';
import 'package:flutter_play/page/red_green_light_page.dart';
import 'package:flutter_play/page/stopwatch_page.dart';
import 'package:flutter_play/page/tilt_list_page.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List<String> _items = ['红绿灯', '秒表', '倾斜列表', '自定义', 'paint'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Play'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () => _onItemTap(index),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    _items[index],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: WidgetStyle.listColor[index % 9]),
                  ),
                ));
          },
          separatorBuilder: (context, index) {
            return Container(
              color: Colors.grey.withOpacity(0.2),
              height: 8,
            );
          },
          itemCount: _items.length),
    );
  }

  void _onItemTap(int index) {
    if (index == 0) {
      Get.to(RedGreenLightPage());
    } else if (index == 1) {
      Get.to(StopwatchPage());
    } else if (index == 2) {
      Get.to(TiltListPage());
    } else if (index == 3) {
      Get.to(PaintTestPage());
    } else if (index == 4) {
      Get.to(PaperPage());
    }
  }
}
