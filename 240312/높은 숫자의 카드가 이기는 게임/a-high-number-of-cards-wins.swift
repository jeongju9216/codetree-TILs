let n = Int(readLine()!)!
var arrB: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    arrB.append(input)
}

let arrA: [Int] = (1...2*n).filter { !arrB.contains($0) }
var drawCards: Set<Int> = []

var result = 0
for numberB in arrB {
    let n2 = 2 * n
    guard numberB + 1 <= n2 else {
        continue
    }

    for numberA in arrA {
        guard !drawCards.contains(numberA),
              !arrB.contains(numberA) else {
            continue
        }

        drawCards.insert(numberA)
        result += 1
        break
    }
}

print(result)