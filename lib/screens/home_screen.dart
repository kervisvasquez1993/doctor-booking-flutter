import 'package:doctor_booking_app/packages/models/models.dart';
import 'package:doctor_booking_app/shared/widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:doctor_booking_app/shared/widgets/titles/section_title.dart';
import 'package:doctor_booking_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello,', style: textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text(
              'Dr. John Doe',
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, color: colorScheme.secondary),
                const SizedBox(width: 4),
                Text(
                  'Dubai, UAE',
                  style: textTheme.bodySmall!
                      .copyWith(color: colorScheme.secondary),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.expand_more,
                  color: colorScheme.secondary,
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                hintText: 'Search for doctors, clinics...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Container(
                  margin: EdgeInsets.all(4.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: colorScheme.onSurfaceVariant,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Icon(Icons.filter_alt_outlined,
                      color: colorScheme.surfaceVariant),
                ),
              )),
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            _DoctorCategories(),
            const SizedBox(height: 16),
            _MySchedule(),
            const SizedBox(height: 24.0),
            _NearbyDoctor()
          ],
        ),
      ),
      bottomNavigationBar: MainNavBar(),
    );
  }
}

class _NearbyDoctor extends StatelessWidget {
  const _NearbyDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        SectionTitle(
            title: 'Nearby Doctors', action: 'View all', onPressed: () {}),
        const SizedBox(height: 8.0),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Divider(height: 24.0, color: colorScheme.surfaceVariant);
          },
          itemCount: Doctor.sampleDoctors.length,
          itemBuilder: (context, index) {
            final doctor = Doctor.sampleDoctors[index];
            return DoctorListTile(doctor: doctor);
          },
        )
      ],
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
            title: 'My Schedule', action: 'View all', onPressed: () {}),
        const AppointmentPreviewCard()
      ],
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Categories', action: 'See all', onPressed: () {}),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: DoctorCategory.values
              .take(5)
              .map((category) => Expanded(
                    child: CircleAvatarWithTextLabel(
                        icon: category.icon, label: category.name),
                  ))
              .toList(),
        )
      ],
    );
  }
}
