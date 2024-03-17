let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
var points: [(a: Int, b: Int)] = []
for _ in 0..<k {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    points.append((input[0] - 1, input[1] - 1))
}

var sets: [Set<Int>] = Array(repeating: [], count: n)
var arr = Array(0..<n)
for num in arr {
    sets[num].insert(num)
}

for _ in 0..<3 {
    for i in 0..<k {
        let a = points[i].a
        let b = points[i].b
        
        let tmp = arr[a]
        arr[a] = arr[b]
        arr[b] = tmp

        sets[a].insert(arr[a])
        sets[b].insert(arr[b])
    }
}

for i in 0..<n {
    var count = 0
    for set in sets {
        if set.contains(i) {
            count += 1
        }
    }
    print(count)
}