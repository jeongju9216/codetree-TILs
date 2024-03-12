let n = Int(readLine()!)!
var arr: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

var result = Int.max
for i in 0..<n {
    var minX = Int.max, minY = Int.max
    var maxX = Int.min, maxY = Int.min
    for j in 0..<n where i != j {
        minX = min(minX, arr[j].x)
        maxX = max(maxX, arr[j].x)
        minY = min(minY, arr[j].y)
        maxY = max(maxY, arr[j].y)
    }

    let square = (maxX - minX) * (maxY - minY)
    result = min(result, square)
}

print(result)