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
    guard i - k >= 0, i + k <= maxCount else {
        continue
    }

    let sum = arr[i-k...i+k].reduce(0, +)
    result = max(result, sum)
}

print(result)