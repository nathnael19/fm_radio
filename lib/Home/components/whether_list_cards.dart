import 'package:ethio_fm_radio/Home/components/wether_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Make sure this import matches your folder structure

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
    "Asebe Teferi",
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
                      margin: EdgeInsets.symmetric(
                        vertical: 0.5.h,
                        horizontal: 10.w,
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
                            // ImageIcon(
                            //   AssetImage(weatherList[index][1]),
                            //   color: weatherList[index][3],
                            // ),
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.network(
                                weatherList[index][1],
                                fit: BoxFit.contain,
                              ),
                            ),

                            SizedBox(width: 6.w),
                            Text(
                              "${weatherList[index][2]}°",
                              style: TextStyle(
                                fontSize: 15.sp,
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
