func checkH(_ x: Int, _ y: Int) -> Bool {
    let minRange = max(y-2, 0)
    let maxRange = min(y+2, 18)

    let arr = Array(minRange...maxRange)
    if arr.count != 5 {
        return false
    }

    let item = board[x][y]
    for i in 0..<5 {
        if board[x][arr[i]] != item {
            return false
        }
    }
    return true
}

func checkV(_ x: Int, _ y: Int) -> Bool {
    let minRange = max(x-2, 0)
    let maxRange = min(x+2, 18)

    let arr = Array(minRange...maxRange)
    if arr.count != 5 {
        return false
    }

    let item = board[x][y]
    for i in 0..<5 {
        if board[arr[i]][y] != item {
            return false
        }
    }
    return true
}

func checkC1(_ x: Int, _ y: Int) -> Bool {
    let minXRange = max(x-2, 0)
    let maxXRange = min(x+2, 18)
    let minYRange = max(y-2, 0)
    let maxYRange = min(y+2, 18)

    let xArr = Array(minXRange...maxXRange)
    let yArr = Array(minYRange...maxYRange)

    if xArr.count != 5 || yArr.count != 5 {
        return false
    }

    let item = board[x][y]
    for i in 0..<5 {
        if board[xArr[i]][yArr[i]] != item {
            return false
        }
    }
    return true
}

func checkC2(_ x: Int, _ y: Int) -> Bool {
    let minXRange = max(x-2, 0)
    let maxXRange = min(x+2, 18)
    let minYRange = max(y-2, 0)
    let maxYRange = min(y+2, 18)

    let xArr = Array(minXRange...maxXRange)
    let yArr = Array(minYRange...maxYRange)

    if xArr.count != 5 || yArr.count != 5 {
        return false
    }

    let item = board[x][y]
    for i in 0..<5 {
        if board[xArr[5-i-1]][yArr[i]] != item {
            return false
        }
    }
    return true
}

var board: [[Int]] = []
for _ in 0..<19 {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    board.append(input)
}

var winColor = 0
var winMid: [Int] = []
for i in 0..<19 where winColor == 0 {
    for j in 0..<19 {
        guard board[i][j] > 0 else {
            continue
        }

        if checkV(i, j) || checkH(i, j) || checkC1(i, j) || checkC2(i, j) {
            winColor = board[i][j] == 1 ? 1 : 2
            winMid = [i + 1, j + 1]
            break
        }
    }
}

print(winColor)
if winColor > 0 {
    print("\(winMid[0]) \(winMid[1])")
}