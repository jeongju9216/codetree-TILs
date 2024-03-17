let n = Int(readLine()!)!
var dict: [String: Int] = [:]
var result = 0
for _ in 0..<n {
    let input = readLine()!
    dict[input, default: 0] += 1
    result = max(result, dict[input] ?? 0)
}

print(result)