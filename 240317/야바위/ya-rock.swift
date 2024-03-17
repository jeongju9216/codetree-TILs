let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append(input)
}

var result = 0
for i in 1...3 {
    var sum = 0
    var cups = Array(repeating: false, count: 3 + 1)
    cups[i] = true
    for abc in arr {
        cups.swapAt(abc[0], abc[1])
        if cups[abc[2]] {
            sum += 1
        }
    }
    result = max(result, sum)
}
print(result)