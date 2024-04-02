import 'package:doctor_booking_app/repositories/doctor_repository.dart';
import 'package:doctor_booking_app/screens/screens.dart';
import 'package:doctor_booking_app/shared/theme/app_theme.dart';
import 'package:doctor_booking_app/state/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final doctorRepository = DoctorRepository();
  runApp(AppScreen(doctorRepository: doctorRepository));
}

class AppScreen extends StatelessWidget {
  const AppScreen({super.key, required this.doctorRepository});
  final DoctorRepository doctorRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: doctorRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(doctorRepository: doctorRepository)
              ..add(LoadHomeEvent()),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme().themeData,
            home: const HomeScreen()),
      ),
    );
  }
}
