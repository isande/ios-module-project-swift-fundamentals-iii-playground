import UIKit

enum Currency: String {
    case cad = "Canadian dollars"
    case mxn = "Mexican pesos"
}

let usToCad = 1.41
let usToMxn = 23.93

var currency: Currency = .cad

func convert(_ dollars: Double) -> Double {
    var result: Double = 0
    if currency == .cad {
        result = usToCad * dollars
    } else if currency == .mxn {
        result = usToMxn * dollars
    }
    return result
}

func convert(amountString: String) -> String? {
    let amount = Double(amountString)
    guard let unwrappedAmount = amount else {
        return nil
    }
    
    let result = convert(unwrappedAmount)
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    let formattedResult = formatter.string(for: result)
    return formattedResult
}

let tenBucks = convert(amountString: "10.00")
let fiftyBucks = convert(amountString: "50.00")

print("Ten dollars USD is \(tenBucks ?? "Oh no!") in \(currency.rawValue).")
print("Fifty dollars USD is \(fiftyBucks ?? "Oh no!") in \(currency.rawValue).")
