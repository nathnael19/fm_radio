import 'package:ethio_fm_radio/Home/components/wether_service.dart';
import 'package:flutter/material.dart'; // Make sure this import matches your folder structure

class WhetherListCards extends StatefulWidget {
  const WhetherListCards({super.key});

  @override
  State<WhetherListCards> createState() => _WhetherListCardsState();
}

class _WhetherListCardsState extends State<WhetherListCards> {
  List weatherList = [];
  bool isLoading = true;

  final List<String> cities = [
    "Addis Ababa",
    "Dire Dawa",
    "Awassa",
    "Gondar",
    "Bahir Dar",
    "Nazret",
    "Dubai",
    "Canada",
    "United States of America",
  ];

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  Future<void> loadWeather() async {
    final data = await fetchWeatherForCities(cities);
    setState(() {
      weatherList = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: weatherList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 0.5,
                        horizontal: 10,
                      ),
                      child: ListTile(
                        tileColor: Colors.white,
                        subtitle: Text("${weatherList[index][4]}"),
                        title: Text(
                          "${weatherList[index][0]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              weatherList[index][1],
                              color: weatherList[index][3],
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "${weatherList[index][2]}°",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
