let n = Int(readLine()!)!
var arrB: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    arrB.append(input)
}

var setA: Set<Int> = []
var setB = Set(arrB)
var result = 0
for numberB in arrB {
    guard numberB + 1 <= 2 * n else {
        continue
    }

    for numberA in numberB+1...2*n {
        guard !setA.contains(numberA),
              !setB.contains(numberA) else {
            continue
        }

        setA.insert(numberA)
        result += 1
        break
    }
}

print(result)