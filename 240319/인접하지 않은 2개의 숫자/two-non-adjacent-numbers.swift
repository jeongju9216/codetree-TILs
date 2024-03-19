let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
for i in 0..<n {
    for j in 0..<n where abs(i - j) > 1 {
        result = max(result, arr[i] + arr[j])
    }
}

print(result)