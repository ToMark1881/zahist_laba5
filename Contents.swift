let symbols: [String: String] = ["f": "AA", "n": "AD", "h": "AF", "e": "AG", "q": "AX",
                                 "r": "DA", "d": "DD", "z": "DF", "o": "DG", "c": "DX",
                                 "i": "FA", "j": "FA", "s": "FD", "a": "FF", "g": "FG", "u": "FX",
                                 "b": "GA", "v": "GD", "k": "GF", "p": "GG", "w": "GX",
                                 "x": "XA", "m": "XD", "y": "XF", "t": "XG", "l": "XX"]

let message = "vdovychenkovlad"
let keyword = "guitar"

func firstStep(_ message: String, and symbols: [String: String]) -> [String] {
    var arrayToRetutn = [String]()
    
    for char in message {
        arrayToRetutn.append(symbols[String(char)]!)
    }
    return arrayToRetutn
}

func secondStep(_ keyword: String, array: [String]) -> [String: [String]] {
    var dictToReturn = [String: [String]]()
    var str = ""
    for a in array {
        str.append(a)
    }
    let workingArray = Array(str)
    let c = (array.count * 2)/keyword.count
    var index = 0
    for _ in 0..<c {
        for char in keyword {
            var arrayInChar = dictToReturn[String(char)] ?? []
            arrayInChar.append(String(workingArray[index]))
            index += 1
            dictToReturn[String(char)] = arrayInChar
        }
    }
    return dictToReturn
}

let array = secondStep(keyword, array: firstStep(message, and: symbols))

let sortedKeyword = Array(keyword).sorted(by: {$0 < $1})

func cypher(_ keyword: [String.Element], array: [String: [String]]) -> String {
    var strToReturn = ""
    for char in keyword {
        let line = array[String(char)]!
        for strLine in line {
            strToReturn.append("\(strLine) ")
        }
    }
    return strToReturn
}

let cypherMessage = cypher(sortedKeyword, array: array)

print("Зашифрованое сообщение:", cypherMessage)
