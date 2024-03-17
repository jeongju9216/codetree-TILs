let n = Int(readLine()!)!
var arr = Array(1...n)

while arr.count > 1 {
    arr.removeFirst()
    arr.append(arr.removeFirst())
}

print(arr[0])