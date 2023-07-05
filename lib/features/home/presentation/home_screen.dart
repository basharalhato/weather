import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unit_one_weather/core/data/error/app_exception.dart';
import 'package:unit_one_weather/core/extentions/app_error_extension.dart';
import 'package:unit_one_weather/features/home/presentation/components/current_forecast_card.dart';
import 'package:unit_one_weather/features/home/presentation/components/day_forecast.dart';
import 'package:unit_one_weather/features/home/presentation/providers/home_weather_provider.dart';
import 'package:unit_one_weather/routing/app_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(homeProvider((31.5017, 34.4668)));
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(homeProvider);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.goNamed(AppRoute.search.name);
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: weather.when(
          error: (e, st) =>
              Center(child: Text((e as AppException).errorMessage(context))),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (items) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CurrentForecastCard(
                    temp: items[0].data.temperatureCelsius.toString(),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final nextFiveDays = [...items.take(6)];
                        nextFiveDays.removeAt(0);
                        return DayForecast(
                          date: nextFiveDays[index].data.date,
                          temp: nextFiveDays[index]
                              .data
                              .temperatureCelsius
                              .toString(),
                        );
                      },
                      childCount: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
