let n = Int(readLine()!)!
var setA: Set<Int> = Set(1...2*n)
var setB: Set<Int> = []
for _ in 0..<n {
    let input = Int(readLine()!)!
    setB.insert(input)
    setA.remove(input)
}

var result = 0
for numB in setB {
    if let higherA = setA.filter { $0 > numB }.min() {
        setA.remove(higherA)
        result += 1
    } else {
        setA.remove(setA.min()!)
    }
}

print(result)