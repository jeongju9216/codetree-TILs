let n = Int(readLine()!)!
var dict: [Int: Int] = [:]
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let y = dict[input[0]] ?? Int.max
    dict[input[0]] = min(input[1], y)
}

let result = dict.values.reduce(0, +)
print(result)