let n = Int(readLine()!)!
var arrB: [Int] = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    arrB.append(input)
}

var arrA: [Int] = []
for i in 1...2*n {
    if !arrB.contains(i) {
        arrA.append(i)
    }
}

arrA.sort()
arrB.sort()

var result = 0
var bIndex = 0
for i in 0..<n {
    if bIndex < n && arrA[i] > arrB[bIndex] {
        result += 1
        bIndex += 1
    }
}

print(result)