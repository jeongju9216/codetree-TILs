let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}

let sum = arr.reduce(0, +)
let avg = sum / n
let result = arr.map { abs(avg - $0) }.reduce(0, +)
print(result / 2)