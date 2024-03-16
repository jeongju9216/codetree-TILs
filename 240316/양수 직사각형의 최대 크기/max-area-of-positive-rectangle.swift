func checkRectangle(_ x: Int, _ y: Int) -> Int {
    var maxY = m
    var result = -1
    for i in x..<n {
        if board[i][y] < 0 {
            break
        } else {
            result = max(result, (i - x + 1))
        }

        for j in y..<maxY {
            if board[i][j] < 0 {
                maxY = j
                break
            } else {
                result = max(result, (i - x + 1) * (j - y + 1))
            }
        }
    }
    return result
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var result = -1
for i in 0..<n {
    for j in 0..<m {
        if board[i][j] > 0 {
            let count = checkRectangle(i, j)
            result = max(result, count)
        }
    }
}

print(result)