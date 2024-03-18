typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func dfs(_ stones: Int, _ board: [[Int]]) {
    guard stones < m else {
        let count = bfs(board)
        result = max(result, count)
        return
    }

    var board = board
    for i in 0..<n {
        for j in 0..<n {
            if board[i][j] == 1 {
                board[i][j] = 0
                dfs(stones + 1, board)
                board[i][j] = 1
            }
        }
    }
}

func bfs(_ board: [[Int]]) -> Int {
    var queue: [Point] = starts
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

            if board[nx][ny] == 0 {
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

var starts: [Point] = []
var index = 0
for _ in 0..<k {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    starts.append((input[0]-1, input[1]-1))
}

var result = 0
dfs(0, board)
print(result)