typealias Point = (x: Int, y: Int)

func calSum(_ p1: Point, _ p2: Point, _ p11: Point, _ p22: Point) -> Int {
    guard p1.x <= p2.x, p1.y <= p2.y else {
        return 0
    }

    guard p11.x <= p22.x, p11.y <= p22.y else {
        return 0
    }

    var sum = 0
    for i in p1.x...p2.x {
        for j in p1.y...p2.y {
            sum += board[i][j]
        }
    }

    for i in p11.x...p22.x {
        for j in p11.y...p22.y {
            sum += board[i][j]
        }
    }

    return sum
}

func canPaint(_ p1: Point, _ p2: Point) -> Bool {
    guard p1.x <= p2.x, p1.y <= p2.y else {
        return false
    }

    for i in p1.x...p2.x {
        for j in p1.y...p2.y {
            if visited[i][j] {
                return false
            }
        }
    }
    return true
}

func checking(_ p1: Point, _ p2: Point) {
    guard p1.x <= p2.x, p1.y <= p2.y else {
        return
    }

    for i in p1.x...p2.x {
        for j in p1.y...p2.y {
            visited[i][j] = true
        }
    }
}

func unchecking(_ p1: Point, _ p2: Point) {
    guard p1.x <= p2.x, p1.y <= p2.y else {
        return
    }

    for i in p1.x...p2.x {
        for j in p1.y...p2.y {
            visited[i][j] = false
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

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var reuslt = Int.min
// 사각형1
for x1 in 0..<n {
    for y1 in 0..<m {
        let p1 = (x1, y1)
        for x2 in 0..<n {
            for y2 in 0..<m {
                let p2 = (x2, y2)
                if canPaint(p1, p2) {
                    checking(p1, p2)

                    for x11 in 0..<n {
                        for y11 in 0..<m {
                            let p11 = (x11, y11)
                            for x22 in 0..<n {
                                for y22 in 0..<m {
                                    let p22 = (x22, y22)
                                    if canPaint(p11, p22) {
                                        reuslt = max(reuslt, calSum(p1, p2, p11, p22))
                                    }
                                }
                            }
                        }
                    }

                    unchecking(p1, p2)
                }
            }
        }
    }
}
print(reuslt)