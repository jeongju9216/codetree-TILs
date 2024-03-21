typealias Point = (s: Int, e: Int)

func check(_ p1: Point, _ p2: Point) -> Bool {
    if p1.s < p2.s && p1.e < p2.e {
        return true
    }

    if p1.e <= p2.s {
        return true
    }

    return false
}

let n = Int(readLine()!)!
var arr: [Point] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

arr.sort { $0.s < $1.s }

var result = 0
for i in 0..<n {
    var isChecked = true
    for j in 0..<n where i != j {
        let minIndex = min(i, j)
        let maxIndex = max(i, j)
        if !check(arr[minIndex], arr[maxIndex]) {
            isChecked = false
            break
        }
    }

    if isChecked {
        result += 1
    }
}
print(result)