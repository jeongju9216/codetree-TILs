typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func bfs(_ start: Point) {
    var queue: [Point] = [start]
    var index = 0
    visited[start.x][start.y] = true

    while index < queue.count {
        let (x, y) = queue[index]
        index += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            guard 0..<n ~= nx, 0..<m ~= ny else {
                continue
            }

            guard board[nx][ny] > k, !visited[nx][ny] else {
                continue
            }

            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var visited: [[Bool]] = []
var maxCount = 0, k = 1
while true {
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var currentCount = 0
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] > k && !visited[i][j] {
                currentCount += 1
                bfs((i, j))
            }
        }
    }

    if currentCount <= maxCount {
        break
    }
    maxCount = currentCount
    k += 1
}

print(maxCount, k - 1)