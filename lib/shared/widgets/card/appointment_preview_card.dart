import 'package:flutter/material.dart';

class AppointmentPreviewCard extends StatelessWidget {
  final dynamic appointment;
  const AppointmentPreviewCard({super.key, this.appointment});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [colorScheme.primary, colorScheme.tertiary]),
          ),
          child: Column(
            children: [
              SizedBox(
                  height: 100,
                  child: Center(
                    child: Text('no appointment',
                        style: textTheme.bodyMedium!
                            .copyWith(color: Colors.white)),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
