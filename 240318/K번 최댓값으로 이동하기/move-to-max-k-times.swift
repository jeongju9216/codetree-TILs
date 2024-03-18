typealias Point = (x: Int, y: Int)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func findNextPoint(_ point: Point) -> Point? {
    let startItem = board[point.x][point.y]
    var queue: [Point] = [point]
    var index = 0

    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    visited[point.x][point.y] = true

    while index < queue.count {
        let (x, y) = queue[index]
        index += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            guard 0..<n ~= nx, 
                  0..<n ~= ny, 
                  !visited[nx][ny], 
                  board[nx][ny] < startItem 
            else {
                continue
            }

            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }

    if queue.count == 1 {
        return nil
    }

    let sortedQueue = queue[1...].sorted {
        if board[$0.x][$0.y] != board[$1.x][$1.y] {
            return board[$0.x][$0.y] > board[$1.x][$1.y]
        } else if $0.x != $1.x {
            return $0.x < $1.x
        } else {
            return $0.y < $1.y
        }
    }
    return sortedQueue[0]
}


let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
var board: [[Int]] = []
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}
let rc = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var currentPoint: Point = (rc[0] - 1, rc[1] - 1)
for _ in 0..<k {
    if let nextPoint = findNextPoint(currentPoint) {
        currentPoint = nextPoint
    } else {
        break
    }
    
}
print(currentPoint.x + 1, currentPoint.y + 1)