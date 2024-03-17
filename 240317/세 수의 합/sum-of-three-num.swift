let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
for i in 0..<n {
    var counts: [Int: Int] = [:]

    for j in 0..<n where i != j {
        let num1 = arr[i]
        let num2 = arr[j]
        let diff = k - (num1 + num2)
        
        result += counts[diff] ?? 0
        counts[diff, default: 0] += 1
    }
}
print(result)