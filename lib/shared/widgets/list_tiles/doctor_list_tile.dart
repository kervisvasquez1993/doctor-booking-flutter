import 'package:doctor_booking_app/packages/models/models.dart';
import 'package:doctor_booking_app/screens/screens.dart';
import 'package:flutter/material.dart';

class DoctorListTile extends StatelessWidget {
  final Doctor doctor;
  const DoctorListTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DoctorDetailsScreen(doctorId: doctor.id);
        }));
      },
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 24.0,
        backgroundColor: colorScheme.background,
        backgroundImage: NetworkImage(doctor.profileImageUrl),
      ),
      title: Text(
        doctor.name,
        style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4.0),
          Text(
            doctor.category.name,
            style: textTheme.bodyMedium!.copyWith(color: colorScheme.secondary),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orangeAccent),
              const SizedBox(width: 4),
              Text(doctor.rating.toString(),
                  style: textTheme.bodySmall!.copyWith(
                      color: colorScheme.onBackground.withOpacity(.5),
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 16),
              Icon(Icons.work, color: colorScheme.tertiary, size: 16),
              const SizedBox(width: 4),
              Text(
                '3 years',
                style: textTheme.bodySmall!.copyWith(
                    color: colorScheme.onBackground.withOpacity(.5),
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
      trailing: FilledButton(
        onPressed: () {},
        child: Text('Book now'),
      ),
    );
  }
}
