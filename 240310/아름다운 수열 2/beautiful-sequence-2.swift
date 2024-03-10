let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = min(n, nm[1])
let arrA = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let arrB = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
let setB = Set(arrB)
for i in 0...n-m {
    let setA = Set(arrA[i..<i+m])
    if setA == setB {
        result += 1
    }
}

print(result)