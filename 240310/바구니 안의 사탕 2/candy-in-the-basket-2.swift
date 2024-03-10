let maxCount = 100
let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]

var arr: [Int] = Array(repeating: 0, count: maxCount + 1)
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let candies = input[0]
    let point = input[1]
    arr[point] += candies
}

var result = Int.min
for i in 0...maxCount {
    let start = max(0, i - k)
    let end = min(maxCount, i + k)
    
    let sum = arr[start...end].reduce(0, +)
    result = max(result, sum)
}

print(result)