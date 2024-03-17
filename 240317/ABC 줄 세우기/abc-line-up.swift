let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }

let n = Int(readLine()!)!
var arr = readLine()!.split { $0 == " " }.map { String($0) }
let std = Array(letters[..<n])

var result = 0
while arr != std {
    result += 1
    var tmp = arr

    var maxCorrectCount = 0
    var maxTmp = tmp
    for i in 1..<n {
        tmp.swapAt(i, i-1)

        var correct = 0
        for i in 0..<n {
            if tmp[i] == std[i] {
                correct += 1
            }
        }

        if maxCorrectCount < correct {
            maxCorrectCount = correct
            maxTmp = tmp
        }

        tmp = arr
    }

    arr = maxTmp
}
print(result)