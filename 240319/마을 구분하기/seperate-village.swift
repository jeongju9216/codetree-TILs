typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func bfs(_ start: Point) -> Int {
    var queue: [Point] = [start]
    var index = 0
    visited[start.x][start.y] = true

    while index < queue.count {
        let (x, y) = queue[index]
        index += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            guard 0..<n ~= nx, 0..<n ~= ny else {
                continue
            }

            guard board[nx][ny] == 1, !visited[nx][ny] else {
                continue
            }

            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }

    return queue.count
}

let n = Int(readLine()!)!
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var townCount = 0
var peopleCount: [Int] = []
for i in 0..<n {
    for j in 0..<n {
        if board[i][j] == 1 && !visited[i][j] {
            townCount += 1
            let people = bfs((i, j))
            peopleCount.append(people)
        }
    }
}

print(townCount)
for people in peopleCount.sorted(by: <) {
    print(people)
}