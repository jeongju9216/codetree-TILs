typealias Point = (s: Int, e: Int)

func check(_ p1: Point, _ p2: Point) -> Bool {
    if p1.s < p2.s && p1.e < p2.e {
        return true
    } else if p1.s > p2.s && p1.e > p2.e {
        return true
    }

    if p1.e <= p2.s {
        return true
    } else if p1.s >= p2.e {
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

var result = 0
for i in 0..<n {
    var isChecked = true
    for j in 0..<n where i != j {
        if !check(arr[i], arr[j]) {
            isChecked = false
            break
        }
    }

    if isChecked {
        result += 1
    }
}
print(result)