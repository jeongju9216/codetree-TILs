let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = Int.min
for i in 0..<n-k {
    let sum = arr[i..<i+k].reduce(0, +)
    result = max(result, sum)
}

print(result)