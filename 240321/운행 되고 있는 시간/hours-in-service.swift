typealias Point = (s: Int, e: Int)

let n = Int(readLine()!)!
var arr: [Point] = []
for _ in 0..<n {
    let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append((ab[0], ab[1]))
}

var result = 0
for i in 0..<n {
    var times = Array(repeating: 0, count: 1000 + 1)
    for j in 0..<n where i != j {
        let time = arr[j]
        for t in time.s..<time.e {
            times[t] = 1
        }
    }

    let sum = times.reduce(0, +)
    result = max(result, sum)
}
print(result)