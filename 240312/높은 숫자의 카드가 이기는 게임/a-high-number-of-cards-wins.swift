let n = Int(readLine()!)!
var arrB: [Int] = []
var arrA = Array(1...2*n)
for _ in 0..<n {
    let input = Int(readLine()!)!
    arrB.append(input)
    arrA.removeAll { $0 == input }
}

var result = 0
for numberB in arrB {
    for numberA in arrA {
        if numberA > numberB {
            arrA.removeAll { $0 == numberA }
            result += 1
            break
        }
    }
}

print(result)