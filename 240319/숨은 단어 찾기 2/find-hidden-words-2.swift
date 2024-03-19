let dx = [-1, -1, -1, 0, 1, 1, 1, 0]
let dy = [-1, 0, 1, 1, 1, 0, -1, -1]

let target = ["L", "E", "E"]

func checkString(_ x: Int, _ y: Int) {
    let item = board[x][y]
    for i in 0..<dx.count {
        var arr: [String] = [item]
        for j in 1...2 {
            let nx = x + dx[i] * j
            let ny = y + dy[i] * j

            guard 0..<n ~= nx, 0..<m ~= ny else {
                continue
            }

            arr.append(board[nx][ny])        
        }

        if arr == target {
            result += 1
        }
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var board: [[String]] = []
for _ in 0..<n {
    let input = Array(readLine()!).map { String($0) }
    board.append(input)
}

var result = 0
for i in 0..<n {
    for j in 0..<m {
        if board[i][j] == "L" {
            checkString(i, j)
        }
    }
}
print(result)