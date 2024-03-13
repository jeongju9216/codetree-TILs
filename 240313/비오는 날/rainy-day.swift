struct WeatherInfo {
    let date: String
    let day: String
    let weather: String
}

let n = Int(readLine()!)!
var arr: [WeatherInfo] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    arr.append(WeatherInfo(date: input[0], day: input[1], weather: input[2]))
}

let firstRain = arr.first(where: { $0.weather == "Rain" })!
print("\(firstRain.date) \(firstRain.day) \(firstRain.weather)")