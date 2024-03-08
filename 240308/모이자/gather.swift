let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = Int.max
for i in 0..<n {
    let house = arr[i]
    var sum = 0
    for j in 0..<n {
        let distance = abs(i - j)
        let count = arr[j]

        sum += (distance * count)
    }
    result = min(result, sum)
}

print(result)