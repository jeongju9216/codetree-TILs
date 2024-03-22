import Foundation

typealias Item = (n: Int, p: Int)

let n = Int(readLine()!)!
let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var arr: [Item] = []
for i in 0..<n {
    arr.append((input[i], i))
}

arr.sort { $0.n < $1.n }

var result: [Int] = Array(repeating: 0, count: n)
for i in 0..<n {
    let (n, p) = arr[i]
    result[p] = i + 1
}

result.forEach { print($0, terminator: " ") }