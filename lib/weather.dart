import 'package:flutter/material.dart';
import 'package:unicode_app/repo.dart';
import 'package:unicode_app/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => Weather();
}

class Weather extends State<WeatherPage> {
  TextEditingController cityName = TextEditingController();
  WeatherModel? weatherDetails;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Weather"),
            backgroundColor: const Color.fromARGB(236, 255, 187, 0),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: cityName,
                decoration: const InputDecoration(
                    labelText: "City", prefixIcon: Icon(Icons.location_city)),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () async {
                  weatherDetails = await Repo().getWeather(cityName.text);
                  setState(() {});
                },
                color: const Color.fromARGB(236, 255, 187, 0),
                child: const Text("Search"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Name : ${weatherDetails?.name ?? ""}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Country : ${weatherDetails?.sys?.country ?? ""}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Feels Like : ${weatherDetails?.main?.feelsLike ?? ""} F",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Temp : ${weatherDetails?.main?.temp ?? ""} F",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Max Temp : ${weatherDetails?.main?.tempMax ?? ""} F",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Min Temp : ${weatherDetails?.main?.tempMin ?? ""} F",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Humidity : ${weatherDetails?.main?.humidity ?? ""} %",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Visibility : ${weatherDetails?.visibility ?? ""} m",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Wind : ${weatherDetails?.wind?.speed ?? ""} km/h",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          )),
    );
  }
}
