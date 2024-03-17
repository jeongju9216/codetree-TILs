let n = Int(readLine()!)!
var arr = Array(1...n)

while arr.count > 1 {
    var tmp: [Int] = arr.reversed()
    tmp.removeLast()
    let lastItem = tmp.removeLast()
    arr = tmp.reversed()
    arr.append(lastItem)
}

print(arr[0])