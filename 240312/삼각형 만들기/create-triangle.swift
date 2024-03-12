func calculate(_ i: Int, _ j: Int, _ k: Int) -> Int {
    let p1 = arr[i]
    let p2 = arr[j]
    let p3 = arr[k]

    if p1.x == p2.x && p1.y == p3.y {
        let diff = (p1.x * p2.y + p2.x * p3.y + p3.x * p1.y) - (p2.x * p1.y + p3.x * p2.y + p1.x * p3.y)
        return abs(diff)
    } else {
        return 0
    }
}

let n = Int(readLine()!)!
var arr: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

var result = 0
for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            if i != j && j != k && i != k {
                result = max(result, calculate(i, j, k))
            }
        }
    }
}

print(result)