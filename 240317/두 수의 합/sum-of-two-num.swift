let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
let arr = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var set: Set<Int> = []
for num in arr {
    set.insert(num)
}

var result = 0
var visited: Set<Int> = []
for num in arr {
    if set.contains(m - num) && !visited.contains(num) {
        visited.insert(num)
        visited.insert(m - num)
        result += 1
    }
}

print(result)