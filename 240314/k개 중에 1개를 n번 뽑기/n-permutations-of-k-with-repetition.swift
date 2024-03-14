func backtracking(_ arr: [Int]) {
    guard arr.count < n else {
        arr.forEach { print($0, terminator: " ") }
        print()
        return
    }

    for num in 1...k {
        backtracking(arr + [num])
    }
}

let kn = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let k = kn[0], n = kn[1]

backtracking([])