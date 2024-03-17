let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
var points: [[Int]] = []
for _ in 0..<k {
    let input = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    points.append(input)
}

var sets: [Set<Int>] = Array(repeating: [], count: n + 1)
var arr = Array(0...n)
for num in arr {
    sets[num].insert(num)
}

for _ in 0..<3 {
    for i in 0..<k {
        let a = points[i][0]
        let b = points[i][1]
        
        let tmp = arr[a]
        arr[a] = arr[b]
        arr[b] = tmp

        for j in 1...n {
            sets[j].insert(arr[j])
        }
    }
}

for i in 1...n {
    var count = 0
    for set in sets {
        if set.contains(i) {
            count += 1
        }
    }
    print(count)
}