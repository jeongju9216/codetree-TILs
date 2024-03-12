let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
var minValue = arr[0]
for i in 1..<n {
    if minValue > arr[i] {
        minValue = arr[i]
    } else {
        result = max(result, arr[i] - minValue)
    }
}

print(result)