typealias Point = (x: Int, y: Int)

let dx = [1, 0]
let dy = [0, 1]

func dfs(_ point: Point) {
    if canOut {
        return
    }

    if point.x == n - 1 && point.y == m - 1 {
        canOut = true
        return
    }

    for i in 0..<dx.count {
        let nx = point.x + dx[i]
        let ny = point.y + dy[i]

        guard 0..<n ~= nx, 0..<m ~= ny else {
            continue
        }

        guard board[nx][ny] == 1, !visited[nx][ny] else {
            continue
        }

        visited[nx][ny] = true
        dfs((nx, ny))
        visited[nx][ny] = false
    }
}

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var canOut = false
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
visited[0][0] = true
dfs((0, 0))

print(canOut ? 1 : 0)