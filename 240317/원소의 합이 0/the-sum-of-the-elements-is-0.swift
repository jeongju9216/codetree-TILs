let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<4 {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append(input)
}

var counts: [Int: Int] = [:]
for i in 0..<n {
    for j in 0..<n {
        counts[arr[0][i] + arr[1][j], default: 0] += 1
    }
}

var result = 0
for i in 0..<n {
    for j in 0..<n {
        let diff = 0 - (arr[2][i] + arr[3][j])
        result += counts[diff] ?? 0
    }
}

print(result)