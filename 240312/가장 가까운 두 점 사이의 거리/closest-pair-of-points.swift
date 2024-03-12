let n = Int(readLine()!)!
var arr: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

var result = Int.max
for i in 0..<n {
    for j in 0..<n where i != j {
        let diffX = abs(arr[i].x - arr[j].x)
        let diffY = abs(arr[i].y - arr[j].y)
        let distance = diffX * diffX + diffY * diffY
        result = min(result, distance)
    }
}

print(result)