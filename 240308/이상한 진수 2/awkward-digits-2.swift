import Foundation

func decimal(_ arr: [Int]) -> Int {
    var sum = 0
    for i in 0..<arr.count {
        sum += arr[i] * Int(pow(2.0, Double(i)))
    }
    return sum
}

let input = Array(readLine()!).map { Int(String($0))! }

var result = 0
for i in 0..<input.count {
    var tmp = input
    tmp[i] = tmp[i] == 0 ? 1 : 0
    let num = decimal(tmp.reversed())
    result = max(result, num)
}

print(result)