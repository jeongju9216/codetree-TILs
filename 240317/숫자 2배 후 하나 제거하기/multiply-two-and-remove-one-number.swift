let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = Int.max
for i in 0..<n {
    let arr2 = (0..<n).map { 
        $0 == i ? arr[$0] * 2 : arr[$0]
    }

    for j in 0..<n {
        var sum = 0
        let arr3 = (0..<n).compactMap {
            $0 == j ? nil : arr2[$0]
        }
        for k in 1..<arr3.count {
            sum += abs(arr3[k] - arr3[k-1])
        }
        result = min(result, sum)
    }
}

print(result)