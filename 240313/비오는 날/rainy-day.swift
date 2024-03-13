struct WeatherInfo {
    let date: String
    let day: String
    let weather: String
}

var days: [String: Int] = [
    "Mon": 0,
    "Tue": 1,
    "Wed": 2,
    "Thu": 3,
    "Fri": 4,
    "Sat": 5,
    "Sun": 6
]

let n = Int(readLine()!)!
var arr: [WeatherInfo] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    arr.append(WeatherInfo(date: input[0], day: input[1], weather: input[2]))
}

arr.sort { 
    $0.date == $1.date 
    ? days[$0.day]! < days[$1.day]! 
    : $0.date < $1.date 
}

let firstRain = arr.first(where: { $0.weather == "Rain" })!
print("\(firstRain.date) \(firstRain.day) \(firstRain.weather)")