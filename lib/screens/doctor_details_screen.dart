import 'package:doctor_booking_app/packages/models/models.dart';
import 'package:doctor_booking_app/shared/utils/time_of_day_extensions.dart';
import 'package:doctor_booking_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final String doctorId;
  const DoctorDetailsScreen({super.key, required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return DoctorDetailsView();
  }
}

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: AppIconButton(
          icon: Icons.arrow_back,
          onTap: () => Navigator.pop(context),
        ),
        title: Text('Doctor details',
            style:
                textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
        actions: [AppIconButton(icon: Icons.favorite_outline, onTap: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorCard(doctor: Doctor.sampleDoctors[0]),
            Divider(height: 32.0, color: colorScheme.surfaceVariant),
            _DoctorWorkingHours()
          ],
        ),
      ),
    );
  }
}

class _DoctorWorkingHours extends StatelessWidget {
  const _DoctorWorkingHours({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorSheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Working hours',
            style:
                textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        ListView.separated(
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          itemCount: Doctor.sampleDoctors[0].workingHours.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                    child: Text(
                        Doctor.sampleDoctors[0].workingHours[index].dayOfWeek)),
                const SizedBox(width: 16.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorSheme.surfaceVariant),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    Doctor.sampleDoctors[0].workingHours[index].startTime
                        .toCustomString(),
                    style: textTheme.bodySmall!.copyWith(
                        color: colorSheme.onBackground.withOpacity(.5)),
                  ),
                ),
                const SizedBox(width: 16.0),
                Text('-'),
                const SizedBox(width: 16.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: colorSheme.surfaceVariant),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                    Doctor.sampleDoctors[0].workingHours[index].endTime
                        .toCustomString(),
                    style: textTheme.bodySmall!.copyWith(
                        color: colorSheme.onBackground.withOpacity(.5)),
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
