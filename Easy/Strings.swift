import Foundation

/***
 Have the function LongestWord(sen) take the sen parameter being passed and return the largest word in the string. If there are two or more words that are the same length, return the first word from the string with that length. Ignore punctuation and assume sen will not be empty. 
 ***/
// using reduce
func longestWord1(_ sen: String) -> String { 
  // get the valid words
  let arr =  sen.components(separatedBy: CharacterSet.punctuationCharacters).joined()
                .components(separatedBy: CharacterSet.whitespaces)
  // get the longest word
  return arr.reduce("", {
      $1.count > $0.count ? $1 : $0
  })
}

// using max
func longestWord2(_ sen: String) -> String { 
  // get the valid words
  let arr =  sen.components(separatedBy: CharacterSet.punctuationCharacters).joined()
                .components(separatedBy: CharacterSet.whitespaces)
                
  // get the longest word
  return arr.max {
      a, b in a.count < b.count
  }!
}

// using sort
func longestWord3(_ sen: String) -> String { 
  // get the valid words
  let arr =  sen.components(separatedBy: CharacterSet.punctuationCharacters).joined()
                .components(separatedBy: CharacterSet.whitespaces)              
  // get the longest word
  let sortedArr = arr.sorted() {
      $0.count > $1.count
  }
  return sortedArr[0]
}

print(longestWord1("fun&!! time")) // time
print(longestWord1("I love dogs")) // love

print(longestWord2("fun&!! time")) // time
print(longestWord2("I love dogs")) // love

print(longestWord3("fun&!! time")) // time
print(longestWord3("I love dogs")) // love


/***
Have the function FirstReverse(str) take the str parameter being passed and return the string in reversed order. For example: if the input string is "Hello World and Coders" then your program should return the string "sredoC dna dlroW olleH" 
***/ 
func FirstReverse1(_ str: String) -> String { 
  var result = "" 
  for character in str {
    result = "\(character)" + result
  }  
  return result        
}

// using Swift reversed
func FirstReverse2(_ str: String) -> String { 
  return String(str.reversed())       
}

print(FirstReverse1("Hello World and Coders")) // "sredoC dna dlroW olleH" 
print(FirstReverse2("Hello World and Coders")) // "sredoC dna dlroW olleH" 


/***
Have the function LetterCapitalize(str) take the str parameter being passed and capitalize the first letter of each word. 
Words will be separated by only one space. 
***/
func LetterCapitalize(_ str: String) -> String { 
  return str.capitalized         
}

/***
Have the function SimpleSymbols(str) take the str parameter being passed and determine 
if it is an acceptable sequence by either returning the string true or false.
The str parameter will be composed of + and = symbols with several letters between them 
(ie. ++d+===+c++==a) and for the string to be true each letter must be surrounded by a + symbol.
 So the string to the left would be false. The string will not be empty and will have at least one letter. 
***/
func SimpleSymbols(_ str: String) -> String { 
    let letters = NSCharacterSet.letters
    
    for (index, unicode) in str.unicodeScalars.enumerated() {
        if letters.contains(unicode) {
            if (index - 1 >= 0) && (index + 1 < str.count) {
                let prevIndex = str.index(str.startIndex, offsetBy: index - 1)
                let nextIndex = str.index(str.startIndex, offsetBy: index + 1)
                if (str[prevIndex] != "+") || (str[nextIndex] != "+") {
                    return "false"
                }
            } else {
                return "false"
            }
        }
    }

    return "true";      
}

// using regular expression
func SimpleSymbols(_ str: String) -> String {
	// find letters that are NOT surrounded by '+' 
	let regex = try! NSRegularExpression(pattern: "((?<!\\+)[a-z]|[a-z](?!\\+))", options: [])

	  if regex.firstMatch(in: str, options: [], range: NSMakeRange(0, str.utf16.count)) != nil {
		return "false"
	} else {
		return "true"
	}
}

print(SimpleSymbols("+d+=3=+s+"))	// return "true"
print(SimpleSymbols("f++d+"))		// return "false"


/***
Have the function AlphabetSoup(str) take the str string parameter being passed and return the string with the letters in alphabetical order
(ie. hello becomes ehllo). Assume numbers and punctuation symbols will not be included in the string. 
***/
func AlphabetSoup(_ str: String) -> String { 
  return String(Array(str).sorted())
}

print(AlphabetSoup("coderbyte"))        \\ return "bcdeeorty"
print(AlphabetSoup("hooplah"))          \\ return "ahhloop"


