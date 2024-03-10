let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
let arrA = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let arrB = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = 0
var dictB: [Int: Int] = [:]
for num in arrB {
    dictB[num, default: 0] += 1
}

for i in 0...n-m {
    var dictA: [Int: Int] = [:]
    for num in arrA[i..<i+m] {
        dictA[num, default: 0] += 1
    }
    
    if dictA == dictB {
        result += 1
    }
}

print(result)