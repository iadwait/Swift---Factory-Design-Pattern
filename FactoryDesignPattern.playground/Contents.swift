import UIKit

struct Bill {
    
    let billID: Int
    let billDate: Date
    
    static func getBill() -> [Bill] {
        return [Bill(billID: Int.random(in: 1..<1000), billDate: Date()),
                Bill(billID: Int.random(in: 1..<1000), billDate: Date())]
    }
    
}

enum BillType {
    case water
    case electricity
    case restaurant
}

protocol BillProtocol {
    func getBill() -> Array<Bill>
}

class BillFactory {
    
    static func create(type: BillType) -> BillProtocol {
        switch type {
        case .water:
            return WaterBill()
        case .electricity:
            return ElectricityBill()
        case .restaurant:
            return RestaurantBill()
        }
    }
    
}

class WaterBill: BillProtocol {
 
    func getBill() -> Array<Bill> {
        print("Fetching Water Bill")
        return Bill.getBill()
    }
    
}

class ElectricityBill: BillProtocol {
 
    func getBill() -> Array<Bill> {
        print("Fetching Electricity Bill")
        return Bill.getBill()
    }
    
}

class RestaurantBill: BillProtocol {
 
    func getBill() -> Array<Bill> {
        print("Fetching Restaurant Bill")
        return Bill.getBill()
    }
    
}

class BillViewModel {
    
    
//    let objWaterBill = WaterBill()
//    let objElectricityBill = ElectricityBill()
//    let objRestaurantBill = RestaurantBill()
    
//    func getBill(type: BillType) {
//        
//        switch type {
//        case .water:
//            objWaterBill.getBill()
//        case .electricity:
//            objElectricityBill.getBill()
//        case .restaurant:
//            objRestaurantBill.getBill()
//        }
//        
//    }
    
    private let bill: BillProtocol
    
    init(bill: BillProtocol) {
        self.bill = bill
    }
    
    func getBill() -> Array<Bill> {
        return bill.getBill()
    }
    
}

let objBill = BillViewModel(bill: BillFactory.create(type: .restaurant))
objBill.getBill()




