typealias Point = (x: Int, y: Int)

let booms: [[Point]] = [
    [(-1, 0), (-2, 0), (1, 0), (2, 0)],
    [(-1, 0), (0, 1), (1, 0), (0, -1)],
    [(-1, -1), (-1, 1), (1, 1), (1, -1)]
]

func countGround() -> Int {
    var count = 0
    for i in 0..<n {
        for j in 0..<n {
            if board[i][j] > 0 || board[i][j] == -1 {
                count += 1
            }
        }
    }
    return count
}

func dfs(_ depth: Int) {
    guard depth < points.count else {
        let counts = countGround()
        result = max(result, counts)
        return
    }

    for i in 0..<booms.count {
        checkBoom(i, points[depth])
        dfs(depth + 1)
        uncheckBoom(i, points[depth])
    }
}

func checkBoom(_ type: Int, _ point: Point) {
    for boom in booms[type] {
        let nx = point.x + boom.x
        let ny = point.y + boom.y

        guard 0..<n ~= nx, 0..<n ~= ny else {
            continue
        }

        if board[nx][ny] >= 0 {
            board[nx][ny] += 1
        }
    }
}

func uncheckBoom(_ type: Int, _ point: Point) {
    for boom in booms[type] {
        let nx = point.x + boom.x
        let ny = point.y + boom.y

        guard 0..<n ~= nx, 0..<n ~= ny else {
            continue
        }

        if board[nx][ny] >= 0 {
            board[nx][ny] -= 1
        }
    }
}

let n = Int(readLine()!)!
var board: [[Int]] = []
var points: [Point] = []
for i in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
    for j in 0..<n {
        if input[j] == 1 {
            points.append((i, j))
            board[i][j] = -1
        }
    }
}

var result = 0
dfs(0)
print(result)