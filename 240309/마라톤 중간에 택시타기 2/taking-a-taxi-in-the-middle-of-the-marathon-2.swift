let n = Int(readLine()!)!
var points: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    points.append((input[0], input[1]))
}

var result = Int.max
for i in 1..<n-1 {
    var sum = 0
    var prev = points[0]
    for j in 1..<n where i != j {
        let distance = abs(points[j].x - prev.x) + abs(points[j].y - prev.y)
        sum += distance
        prev = points[j]
    }

    result = min(result, sum) 
}

print(result)