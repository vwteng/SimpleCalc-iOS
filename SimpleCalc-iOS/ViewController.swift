//
//  ViewController.swift
//  SimpleCalc-iOS
//
//  Created by Vivian on 10/21/15.
//  Copyright © 2015 Vivian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var currNum: String = ""
    var nums: [Int] = [Int]()
    var total: Int = 0
    var operation: String = "not set"
    var newOp: Bool = false

    func reset() -> Void {
        currNum = ""
        nums.removeAll()
        total = 0
        operation = "not set"
        newOp = false
    }

    @IBAction func numInput(sender: UIButton) {
        currNum += sender.currentTitle!
        display.text = currNum
    }
    
    @IBAction func funcInput (sender: UIButton) {
        if operation == "not set" { // first time selecting operation
            operation = sender.currentTitle!
            nums.append(Int(display.text!)!)
            currNum = ""
            display.text = sender.currentTitle!
        } else {
            if operation == sender.currentTitle! { // valid, continuing same operation
                nums.append(Int(display.text!)!)
                currNum = ""
                display.text = sender.currentTitle!
            } else { // error
                display.text = "Error: use only 1 operation at a time"
                reset()
            }
        }
    }
    
    @IBAction func newFuncInput(sender: UIButton) {
        newOp = true
        if operation == "not set" { // first time selecting operation
            operation = sender.currentTitle!
            nums.append(Int(display.text!)!)
            currNum = ""
            display.text = sender.currentTitle!
        } else {
            if operation == sender.currentTitle! { // valid, continuing same operation
                nums.append(Int(display.text!)!)
                currNum = ""
                display.text = sender.currentTitle!
            } else { // error
                display.text = "Error: use only 1 operation at a time"
                reset()
            }
        }
    }
    
    @IBAction func equalInput(sender: UIButton) {
        if nums.count < 1 {
            display.text = "Error: enter a number 1st"
            reset()
        }
        
        if newOp {
            if display.text! != "count" && display.text! != "avg" && display.text! != "fact"{
                nums.append(Int(display.text!)!)
            }
            switch operation {
            case "count":
                total = nums.count
                display.text = String(total)
            case "avg":
                var sum = 0
                for n in nums {
                    sum += n
                }
                total = sum / nums.count
                display.text = String(total)
            case "fact":
                if nums.count > 1 {
                    display.text = "Fact can only accept one number"
                } else {
                    total = 1
                    for var index = nums[0]; index > 0; index-- {
                        total *= index
                    }
                    display.text = String(total)
                }
            default: break
            }
            reset()
        } else {
            if nums.count < 2 {
                if display.text! == "+" || display.text! == "-" || display.text! == "*" || display.text! == "/" || display.text! == "%"  {
                    display.text = "Error: not enough numbers to calculate"
                    reset()
                }
            } else {
                nums.append(Int(display.text!)!)
                
                currNum = ""
                print(nums)
                switch operation {
                case "+":
                    for n in nums {
                        total += n
                    }
                    display.text = String(total)
                case "-":
                    total = nums[0]
                    for var index = 1; index < nums.count; index++ {
                        total -= nums[index]
                    }
                    display.text = String(total)
                case "*":
                    total = 1
                    for n in nums {
                        total *= n
                    }
                    display.text = String(total)
                case "/":
                    total = nums[0]
                    for var index = 1; index < nums.count; index++ {
                        total /= nums[index]
                    }
                    display.text = String(total)
                case "%":
                    total = nums[0]
                    for var index = 1; index < nums.count; index++ {
                        total %= nums[index]
                    }
                    display.text = String(total)
                default: break
                }
                reset()
            }
        }
    }
    
    @IBAction func clearInput(sender: UIButton) {
        display.text = "Enter a number"
        reset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}