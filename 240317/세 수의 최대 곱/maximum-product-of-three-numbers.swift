let n = Int(readLine()!)!
var arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
arr.sort()

let mul1 = arr[0] * arr[1] * arr[n-1]
let mul2 = arr[n-1] * arr[n-2] * arr[n-3]
let result = max(mul1, mul2)
print(result)