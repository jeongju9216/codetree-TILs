let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 0..<4 {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append(input)
}

var sum1: [Int] = []
for i in 0..<n {
    let num = arr[0][i]
    for j in 0..<n {
        sum1.append(num + arr[1][j])
    }
}

var sum2: [Int] = []
for i in 0..<n {
    let num = arr[2][i]
    for j in 0..<n {
        sum2.append(num + arr[3][j])
    }
}

var counts1: [Int: Int] = [:]
for num in sum1 {
    counts1[num, default: 0] += 1
}

var counts2: [Int: Int] = [:]
for num in sum2 {
    counts2[num, default: 0] += 1
}

var result = 0
for num in sum1 {
    let diff = 0 - num
    counts1[num, default: 0] -= 1
    result += counts2[diff] ?? 0
}

print(result)