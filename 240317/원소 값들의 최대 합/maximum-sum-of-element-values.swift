let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
for i in 0..<n {
    var sum = 0
    var next = arr[i] - 1
    for _ in 0..<m {
        sum += arr[next]
        next = arr[next] - 1
    }
    result = max(result, sum)
}
print(result)