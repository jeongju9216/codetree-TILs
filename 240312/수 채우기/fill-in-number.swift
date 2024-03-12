import Foundation

let n = Int(readLine()!)!

var result = 0
var fiveCount = Int(floor(Double(n) / 5.0))
while fiveCount > 0 {
    var tmp = n - fiveCount * 5

    if tmp % 2 == 0 {
        result = fiveCount + tmp / 2
        break
    }

    fiveCount -= 1
}

print(result)