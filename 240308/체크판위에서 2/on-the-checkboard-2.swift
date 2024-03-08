func find(_ x: Int, _ y: Int, _ count: Int) {
    guard x < r, y < c else {
        return
    }

    // 도착지 도착
    if x == r - 1 && y == c - 1 && count == 4 {
        result += 1
        return
    }

    let nextColor = board[x][y] == "W" ? "B" : "W"
    for i in x+1..<r {
        for j in y+1..<c {
            if board[i][j] == nextColor {
                find(i, j, count + 1)
            }
        }
    }
}

let rc = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let r = rc[0], c = rc[1]
var board: [[String]] = []
for _ in 0..<r {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    board.append(input)
}

var result = 0
find(0, 0, 1)

print(result)