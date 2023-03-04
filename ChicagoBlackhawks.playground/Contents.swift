import UIKit

var greeting = "Hello, playground"

struct PlayerDetails {
    let name: String
    let age: Int
    let country: String
    let height: Double
    let birthDate: Date
    let birthDayMonth: String
}

let player1 = PlayerDetails(name: "JOEY ANDERSON", age: 35, country: "USA",
                            height: 6.0, birthDate: getDateFromString(dateString: "1998-06-19"), birthDayMonth: "June")
let player2 = PlayerDetails(name: "ANDREAS ATHANASIOU ", age: 29, country: "CAN",
                            height: 6.2, birthDate: getDateFromString(dateString: "1994/08/06"), birthDayMonth: "August")
let player3 = PlayerDetails(name: "Colin Blackwell", age: 29, country: "USA",
                            height: 5.9, birthDate: getDateFromString(dateString: "1993/03/28"), birthDayMonth: "March")
let player4 = PlayerDetails(name: "JASON DICKINSON ", age: 28, country: "CAN",
                            height: 6.2, birthDate: getDateFromString(dateString: "1995/07/04"), birthDayMonth: "July")

let player5 = PlayerDetails(name: "MAX DOMI ", age: 35, country: "CAN",
                            height: 5.10, birthDate: getDateFromString(dateString: "1995/03/02"), birthDayMonth: "March")

let player6 = PlayerDetails(name: "MACKENZIE ENTWISTLE ", age: 24, country: "CAN",
                            height: 6.3, birthDate: getDateFromString(dateString: "1999/07/14"), birthDayMonth: "July")

let player7 = PlayerDetails(name: "DAVID GUST", age: 28, country: "JAPAN",
                            height: 5.10, birthDate: getDateFromString(dateString: "1994/02/21"), birthDayMonth: "February")


let player8 = PlayerDetails(name: "COLE GUTTMAN ", age: 24, country: "Australia",
                            height: 5.9, birthDate: getDateFromString(dateString: "1999/04/06"), birthDayMonth: "April")

let player9 = PlayerDetails(name: "REESE JOHNSON", age: 25, country: "France",
                             height: 6.1, birthDate: getDateFromString(dateString: "1998/07/10"), birthDayMonth: "July")
let player10 = PlayerDetails(name: "TAYLER JOHNSON", age: 32, country: "USA",
                             height: 5.8, birthDate: getDateFromString(dateString: "1990/07/29"), birthDayMonth: "July")



func getDateFromString(dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    //dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: dateString)
    return date ?? Date()
}




//Create a dictionary of team members using their number as the key value

let playersDictionary = [15: player1,
                         89: player2,
                         43: player3,
                         17: player4,
                         13: player5,
                         58: player6,
                         37: player7,
                         70: player8,
                         52: player9,
                         90: player10]

let allPlayers = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10]

for player in allPlayers {
    print(player)
}

print("\n \n \n \n")

//Create a list of players sorted by age

var sortedByAge: [PlayerDetails] = allPlayers.sorted { player1, player2 in
    return player1.age > player2.age
}

print(sortedByAge)
print("\n \n \n \n")


//Create a list of players sorted by country

var sortedByCountry: [PlayerDetails] = allPlayers.sorted { player1, player2 in
    return player2.country > player1.country
}

print(sortedByCountry)
print("\n \n \n \n")


//Calculate the average age of the players

let totalAge: Int = allPlayers.reduce(0) { partialResult, playerDetail in
    return partialResult + playerDetail.age
}
let averageAge = totalAge / allPlayers.count

print("Average age of all players is \(averageAge)")
print("\n \n")

//Calculate the average height of the players

let heightSum = allPlayers.reduce(0) { partialResult, playerDetail in
    return partialResult + playerDetail.height
}

let averageHeight = heightSum / Double(allPlayers.count)
print("Average height of all players is \(averageHeight)")

print("\n \n ")

//Determine the month in which most of the players birthday falls

var birthdayAndMonthDictionary = [String : Int]()

for player in allPlayers {
    if let count = birthdayAndMonthDictionary[player.birthDayMonth], count > 0 {
        birthdayAndMonthDictionary[player.birthDayMonth] = count + 1
    } else {
        birthdayAndMonthDictionary[player.birthDayMonth] = 1
    }
}

print("\n \n ")

for (key, value) in birthdayAndMonthDictionary {
    print("In \(key) month total \(value) player's birthday is falling")
}
print("\n \n ")

let maxBirthDayMothh = birthdayAndMonthDictionary.sorted(by: {$0.value > $1.value}).first

print("In \(maxBirthDayMothh?.key ?? "") month max players birthday is falling which is total of \(maxBirthDayMothh?.value ?? 0) player's")
