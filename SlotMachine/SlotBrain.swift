//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Roy Montoya on 2/29/16.
//  Copyright © 2016 Roy Montoya. All rights reserved.
//

import Foundation

class SlotBrain {
    
    class func unPackSlotsIntoSlotRows(slots: [[Slot]]) -> [[Slot]]{
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var i = 0; i < slotArray.count; i++ {
                let slot = slotArray[i]
                if i == 0 {
                    slotRow.append(slot)
                }else if i == 1 {
                    slotRow2.append(slot)
                }else if i == 2 {
                    slotRow3.append(slot)
                }else{
                    print("Error")
                }
            }
        }
        var slotsInRow: [[Slot]] = [slotRow, slotRow2, slotRow3]
        return slotsInRow
    }
    
    
    class func computeWinnings(slots:[[Slot]]) -> Int {
        var slotsInRows = unPackSlotsIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var threeOfaKindWinCount = 0
        var straightWinCunt = 0
        
        for slotRow in slotsInRows {
            if checkFlush(slotRow) == true {
                print("Flush")
                winnings += 1
                flushWinCount += 1
            }
            
            if checkThreeInARow(slotRow) == true {
                print("Three in a Row")
                winnings += 1
                straightWinCunt += 1
            }
            
            if checkThreeOfAKing(slotRow) == true {
                print("Three of a kind")
                winnings += 3
                threeOfaKindWinCount += 1
            }
        }
        
        if flushWinCount == 3 {
            print("RoyalFlush")
            winnings += 15
        }
        
        if straightWinCunt == 3 {
            print("Epic Straight")
            winnings += 1000
        }
        
        if threeOfaKindWinCount == 3 {
            print("Three all around")
            winnings += 50
        }
        
        
        return winnings
    }
    
    
    class func checkFlush(slotRow: [Slot])   -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed == true && slot3.isRed == true {
            return true
        }else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false{
            return true
        }else{
            return false
        }
    }
    
    class func checkThreeInARow(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        }else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        }else{
            return false
        }
    }
    
    class func checkThreeOfAKing(slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value && slot1.value == slot3.value {
            return true
        }else{
            return false
        }
    }
}