import 'package:auto_route/auto_route.dart';
import 'package:example_yandex_map/app/_app.dart';
import 'package:example_yandex_map/build_gen/assets.gen.dart';
import 'package:example_yandex_map/data/api/card/_card.dart';
import 'package:example_yandex_map/data/api/rental/models/_models.dart';
import 'package:example_yandex_map/data/repository/rental_repository.dart';
import 'package:example_yandex_map/l10n/localization_extension.dart';
import 'package:example_yandex_map/pages/home/cubit/stations_on_map_cubit.dart';
import 'package:example_yandex_map/pages/home/widgets/_widgets.dart';
import 'package:example_yandex_map/pages/payment_method/cubit/payment_method_cubit.dart';
import 'package:example_yandex_map/pages/widgets/_widgets.dart';
import 'package:example_yandex_map/shared/_shared.dart';
import 'package:example_yandex_map/shared/geolocator/_geolocator.dart';
import 'package:flutter/material.dart' hide Animation;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:yandex_maps_mapkit_lite/image.dart' as image_provider;
import 'package:yandex_maps_mapkit_lite/mapkit.dart' hide Icon, Map, TextStyle;
import 'package:yandex_maps_mapkit_lite/ui_view.dart';

part '_constants_markers.dart';
part '_listeners.dart';
part '_map_view.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StationsOnMapCubit(rentalRepository: context.read<RentalRepository>())
            ..init(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const _MapView());
  }
}
