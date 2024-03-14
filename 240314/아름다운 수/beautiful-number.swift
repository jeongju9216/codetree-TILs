func backtracking(_ arr: [Int]) {
    guard arr.count < n else {
        if arr.count == n {
            result += 1
        }
        return
    }

    for i in 1...min(n, 4) {
        backtracking(arr + Array(repeating: i, count: i))
    }
}

let n = Int(readLine()!)!

var result = 0
backtracking([])
print(result)