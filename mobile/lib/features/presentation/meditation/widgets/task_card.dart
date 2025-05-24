import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';
import 'package:share_plus/share_plus.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // this expand the colum
          // if don't adding expanded the is to be hidden description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    // this for don't make responded screen error
                    Flexible(
                      child: SelectableText(
                        description,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 1),
                    // copy the advice
                    Container(
                      padding: const EdgeInsets.all(1),
                      child: IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          FlutterClipboard.copy(description).then((value) =>
                              sendMSG('copied the advice: $description\.'));
                        },
                      ),
                    ),
                    // share the advice
                    Container(
                      padding: const EdgeInsets.all(1),
                      child: IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () async {
                          final result = await Share.share(
                            'check out new advice \"$description\.\"',
                            subject: '$title Advice',
                          );

                          if (result.status == ShareResultStatus.success) {
                            sendMSG(description);
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
