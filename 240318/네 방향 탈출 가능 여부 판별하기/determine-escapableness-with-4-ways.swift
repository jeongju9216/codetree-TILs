typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var queue: [Point] = [Point(0, 0)]
var index = 0
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
visited[0][0] = true

var result = 0
while index < queue.count {
    let (x, y) = queue[index]
    index += 1

    if x == n - 1 && y == m - 1 {
        result = 1
        break
    }

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        guard 0..<n ~= nx, 
              0..<m ~= ny, 
              !visited[nx][ny] 
        else {
            continue
        }

        visited[nx][ny] = true
        queue.append((nx, ny))
    }
}

print(result)