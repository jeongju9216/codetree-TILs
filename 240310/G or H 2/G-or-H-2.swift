let maxCount = 100
let n = Int(readLine()!)!

var arr: [String] = Array(repeating: "", count: maxCount + 1)
for _ in 0..<n {
    let input = readLine()!.split { $0 == " " }.map { String($0) }
    let point = Int(input[0])!
    arr[point] = input[1]
}

var result = 0
for i in 0...maxCount {
    var gCount = 0, hCount = 0

    guard !arr[i].isEmpty else {
        continue
    }

    for j in i...maxCount {
        guard !arr[j].isEmpty else {
            continue
        }

        if arr[j] == "G" {
            gCount += 1
        } else {
            hCount += 1
        }
        
        if (gCount == 0 && hCount > 0) 
            || (hCount == 0 && gCount > 0)
            || gCount == hCount {
            result = max(result, j - i)
        }
    }
}

print(result)