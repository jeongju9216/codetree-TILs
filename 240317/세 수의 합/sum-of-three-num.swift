let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var counts: [Int: Int] = [:]
for num in arr {
    counts[num, default: 0] += 1
}

var result = 0
for i in 0..<n {
    counts[arr[i], default: 0] -= 1

    for j in 0..<i {
        let num1 = arr[i]
        let num2 = arr[j]
        let diff = k - num1 - num2
        
        result += counts[diff] ?? 0
    }
}
print(result)