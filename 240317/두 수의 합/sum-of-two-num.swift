let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var count: [Int: Int] = [:]
for num in arr {
    count[num, default: 0] += 1
}

var result = 0
for num in arr {
    count[num, default: 0] -= 1
    let diff = m - num
    result += count[diff] ?? 0
}
print(result)