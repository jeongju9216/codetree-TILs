let n = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}

var result = Int.max
for i in 0..<n {
    var sum = 0

    for j in i..<n+i {
        let distance = j - i
        sum += (arr[j] * distance)
    }

    result = min(result, sum)
    arr.append(arr[i])
}

print(result)