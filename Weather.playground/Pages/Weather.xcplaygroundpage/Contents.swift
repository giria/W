import Cocoa

//: [Previous](@previous)

import Foundation

struct WeatherData: Codable {
    let coord: Coordinates
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let rain: Rain?
    let snow: Snow?
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coordinates: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Int
    let tempMin: Double
    let tempMax: Double
}

struct Wind: Codable {
    let speed: Double
    let deg: Double
}

struct Clouds: Codable {
    let all: Int
}

struct Rain: Codable {
    let oneHour: Double?
    let threeHours: Double?
}

struct Snow: Codable {
    let oneHour: Double?
    let threeHours: Double?
}

struct Sys: Codable {
    let type: Int
    let id: Int
    let message: Double
    let country: String
    let sunrise: Int
    let sunset: Int
}


let jsonString = """
{
    "coord": {
        "lon": 139.01,
        "lat": 35.02
    },
    "weather": [
        {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01n"
        }
    ],
    "main": {
        "temp": 281.52,
        "pressure": 1012,
        "humidity": 81,
        "tempMin": 280.15,
        "tempMax": 283.15
    },
    "wind": {
        "speed": 0.47,
        "deg": 107.538
    },
    "clouds": {
        "all": 2
    },
    "dt": 1560350192,
    "sys": {
        "type": 3,
        "id": 2019346,
        "message": 0.0065,
        "country": "JP",
        "sunrise": 1560281377,
        "sunset": 1560333478
    },
    "timezone": 32400,
    "id": 1851632,
    "name": "Shuzenji",
    "cod": 200
}
"""

let jsonData = jsonString.data(using: .utf8)!

let weatherData = try JSONDecoder().decode(WeatherData.self, from: jsonData)


let todayWeather =  "Today's Weather: \(weatherData.weather[0].main) - High: \(weatherData.main.tempMax)°F Low: \(weatherData.main.tempMin)°F"
print(todayWeather)
//: [Next](@next)
