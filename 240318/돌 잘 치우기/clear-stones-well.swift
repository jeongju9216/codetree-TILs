typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func contains(_ arr: [Point], _ point: Point) -> Bool {
    for p in arr {
        if p.x == point.x && p.y == point.y {
            return true
        }
    }
    return false
}

func dfs(_ deletions: [Point]) {
    guard deletions.count < m else {
        let count = bfs(deletions)
        result = max(result, count)
        return
    }

    for i in 0..<n {
        for j in 0..<n {
            if !contains(deletions, (i, j)) && board[i][j] == 1 {
                dfs(deletions + [Point(i, j)])
            }
        }
    }
}

func bfs(_ deletions: [Point]) -> Int {
    var queue: [Point] = queue
    var index = 0
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    for point in queue {
        visited[point.x][point.y] = true
    }

    while index < queue.count {
        let (x, y) = queue[index]
        index += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            guard 0..<n ~= nx, 0..<n ~= ny, !visited[nx][ny] else {
                continue
            }

            if board[nx][ny] == 0 || contains(deletions, (nx, ny)) {
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }

    return queue.count
}

let nkm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nkm[0], k = nkm[1], m = nkm[2]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var queue: [Point] = []
var index = 0
for _ in 0..<k {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    queue.append((input[0]-1, input[1]-1))
}

var result = 0
dfs([])
print(result)