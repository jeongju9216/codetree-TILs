let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let m = Int(readLine()!)!
let arr2 = readLine()!.split { $0 == " " }.map { Int(String($0))! }

let setA = Set(arr)
var result: [Int] = []
for num in arr2 {
    if setA.contains(num) {
        result.append(1)
    } else {
        result.append(0)
    }
}

result.forEach { print($0, terminator: " ") }