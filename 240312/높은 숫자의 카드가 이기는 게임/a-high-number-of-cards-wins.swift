let n = Int(readLine()!)!
var arrB: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    arrB.append(input)
}

var arrA: [Int] = (1...2*n).filter { !arrB.contains($0) }

var result = 0
for numberB in arrB {
    let n2 = 2 * n
    guard numberB + 1 <= n2, arrA.max()! > numberB else {
        arrA.removeFirst()
        continue
    }

    for i in 0..<arrA.count {
        guard !arrB.contains(arrA[i]),
              arrA[i] > numberB else {
            continue
        }

        arrA.remove(at: i)
        result += 1
        break
    }
}

print(result)