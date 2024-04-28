//
//  main.swift
//  study1
//
//  Created by 曾卫 on 2024/4/16.
//
//
import Foundation

enum VendingMachineError:Error{
    case error1
    case error2(coinsNeeded:Int)
    case error3
}
struct Item{
    var price:Int
    var count:Int
}

class VendingMachine{
    var inventory = [
        "Candy bar":Item(price: 6, count: 8),
        "Chips":Item(price: 10, count: 9),
        "Bread":Item(price: 15, count: 5)
    ]
    var coinsDesposited = 0
    func vend(itemName:String) throws{
        guard let item = inventory[itemName] else{
            throw VendingMachineError.error1
        }
        guard item.count > 0 else {
            throw VendingMachineError.error3
        }
        guard item.price <= coinsDesposited else{
            throw VendingMachineError.error2(coinsNeeded: item.price - coinsDesposited)
        }
        coinsDesposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[itemName] = newItem
        print("售卖成功")
    }
}

var machine = VendingMachine()
machine.coinsDesposited = 5

do{
    try machine.vend(itemName: "Chips")
}catch VendingMachineError.error1{
    print("没有这种商品")
}catch VendingMachineError.error2(let coinsNeed){
    print("你需要更多的钱：\(coinsNeed)")
}catch VendingMachineError.error3{
    print("这种商品没有库存了")
}catch{
    print("未知错误")
}
