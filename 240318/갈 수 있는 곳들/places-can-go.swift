typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}
var queue: [Point] = []
var index = 0
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
for _ in 0..<k {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let r = input[0] - 1
    let c = input[1] - 1
    queue.append((r, c))
    visited[r][c] = true
}

while index < queue.count {
    let (x, y) = queue[index]
    index += 1

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        guard 0..<n ~= nx,
              0..<n ~= ny,
              !visited[nx][ny],
              board[nx][ny] == 0
        else {
            continue
        }

        visited[nx][ny] = true
        queue.append((nx, ny))
    }
}

print(queue.count)