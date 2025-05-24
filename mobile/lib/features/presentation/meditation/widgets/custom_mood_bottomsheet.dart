// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_bloc.dart';
import 'package:mental_health_app/features/presentation/meditation/bloc/mode_message/mode_message_state.dart';
import 'package:mental_health_app/features/presentation/meditation/data/chart_mode/data_helper.dart';
import 'package:mental_health_app/features/presentation/meditation/data/model/chart_mode_data_model.dart';
import 'package:mental_health_app/features/presentation/meditation/widgets/chart_widget.dart';
import 'dart:math';

/**
 * recording the mode of user
 */

/// mode bottom sheet
void customMoodBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    // isDismissible: false,
    // This allows the sheet to take up more space if needed
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return CustomBottomSheet();
    },
  );
}

List<ChartModeDataModel> chartModeData = <ChartModeDataModel>[];
final chartKey = GlobalKey<ChartState>();

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  late DataBaseHelper dbHelper;
  late int count;
  late ChartModeDataModel data;

  @override
  void initState() {
    super.initState();
    count = 1;
    dbHelper = DataBaseHelper.instance;
    dbHelper.getDatabase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.7,
      maxChildSize: 1,
      builder: (_, controller) =>
          BlocBuilder<MoodMessageBloc, MoodMessageState>(
        builder: (context, state) {
          return Container(
            color: DefaultColors.white,
            child: Container(
              margin: const EdgeInsets.all(16),
              child: ListView(
                controller: controller,
                children: [
                  Container(
                    height: 400,
                    child: ChartWidget(
                      key: chartKey,
                    ),
                  ),
                  Container(
                    height: 400,
                    child: ChartBubble(
                      key: chartKey,
                    ),
                  ),
                  Container(
                    height: 400,
                    child: ColumnSeriesChartWidget(
                      key: chartKey,
                    ),
                  ),
                  SizedBox(height: 15),
                  // clear database
                  ElevatedButton(
                    onPressed: () async {
                      chartModeData = await dbHelper.getDatabase();
                      if (chartModeData.isNotEmpty) {
                        data = chartModeData.last;
                        dbHelper.delete();
                        chartModeData = await dbHelper.getDatabase();
                        chartKey.currentState?.setState(
                          () {},
                        );
                        count--;
                      }
                      sendMSG('Clear process is done').then((_) {
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Clear'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  int getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }
}
