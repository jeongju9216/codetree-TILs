func isHappy(_ arr: [Int]) -> Bool {
    guard m > 1 else { 
        return true 
    }

    var count = 1
    for i in 1..<n {
        if arr[i] == arr[i-1] {
            count += 1
        } else {
            count = 1
        }

        if count == m {
            return true
        }
    }

    return false
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var arr: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append(input)
}

var result = 0
for i in 0..<n {
    let hLine = arr[i]
    if isHappy(hLine) {
        result += 1
    }

    let vLine = (0..<n).map { arr[$0][i] }
    if isHappy(vLine) {
        result += 1
    }
}

print(result)