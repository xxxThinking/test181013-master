//
//  ViewController.swift
//  test181013
//
//  Created by s20171105405 on 2018/10/13.
//  Copyright © 2018年 s20171105405. All rights reserved.
//

import UIKit

// 定义一个Stack类型的栈
public struct Stack<T> {
    
    // 数组作为辅助存储器，主要是用来存储Stack里面的元素
    fileprivate var elements = [T]()
    
    // 构造器
    public init() {}
    
    // 出栈操作：从Stack中删除一个元素，并且将其返回
    public mutating func pop() -> T?{
        return self.elements.popLast()
    }
    
    // 压栈操作：将数据元素压入栈底(类似于数组中的添加元素)
    public mutating func push(element: T){
        self.elements.append(element)
    }
    
    // 出栈操作：从Stack中返回一个数据元素，但是不会将其从Stack中删除
    public func peek() -> T? {
        return self.elements.last
    }
    // 用于获取Stack里面的元素个数
    public var count: Int {
        return self.elements.count
    }
}


class ViewController: UIViewController {

    var temp:Double = 0
    var remember: Bool = true
    var count = 0
    var temp1: Int = 0
    var count3 = 0
    var sum : Double = 1
    var count1 = 0
    @IBOutlet weak var display: UITextField!
    @IBAction func H1(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "1"
    }
    @IBAction func H2(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "2"
    }
    @IBAction func H3(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "3"
    }
    @IBAction func H4(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "4"
    }
    @IBAction func H5(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text!  + "5"
    }
    @IBAction func H6(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "6"
    }
    @IBAction func H7(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "7"
    }
    @IBAction func H8(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "8"
    }
    @IBAction func H9(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "9"
    }
    @IBAction func H0(_ sender: Any) {
        display.text = display.text! + "0"
    }
    
    var myStack = Stack<Double>()
    var OmyStack = Stack<Int>()

    @IBAction func SUM(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
            
        } else
        {
        count = 1
            temp = Double(display.text!)!
            myStack.push(element:temp)
            if(count1 == 0){
                OmyStack.push(element: count)
            }else{
                    let x = OmyStack.pop()
                    switch(x){
                    case 3: sum /= myStack.pop()!
                    case 4: sum *= myStack.pop()!
                    default : count3 += 1
                    }
                if(x == 3||x == 4){
                myStack.push(element: sum)
                }
            }
            if(count3 > 0){
                OmyStack.push(element: count)
                count3 = 0
            }
            OmyStack.push(element: count)
            remember = true
            display.text = ""
            count1 += 1
        }
    }
    @IBAction func reduce(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
            
        } else
        {
        count = 2
            temp = Double(display.text!)!
            myStack.push(element:temp)
            if(count1 == 0){
                OmyStack.push(element: count)
            }else{
                    let x = OmyStack.pop()
                    switch(x){
                    case 3: sum /= myStack.pop()!
                    case 4: sum *= myStack.pop()!
                    default : count3 += 1
                    }
                if(x == 3||x == 4){
                    myStack.push(element: sum)
                }
            }
            if(count3 > 0){
                OmyStack.push(element: count)
                count3 = 0
            }
            OmyStack.push(element: count)
            remember = true
            display.text = ""
            count += 1
        }
    }
    @IBAction func division(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
            
        } else
        {
            count = 3
            temp = Double(display.text!)!
            myStack.push(element:temp)
            if(count1 == 0){
                sum = myStack.pop()!
                myStack.push(element: sum)
            }else{
                let x = OmyStack.pop()
                switch(x){
                case 3: sum = myStack.pop()! / myStack.pop()!
                case 4: sum = myStack.pop()! * myStack.pop()!
                default : count3 += 1
                }
                if(x == 3||x == 4){
                    myStack.push(element: sum)
                }
            }
            OmyStack.push(element: count)
            remember = true
            display.text = ""
            count1 += 1
        }
    }
    @IBAction func multiplication(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
            
        } else
        {
            count = 4
            temp = Double(display.text!)!
            myStack.push(element:temp)
            if(count1 == 0){
                sum = myStack.pop()!
                myStack.push(element: sum)
            }else {
                let x = OmyStack.pop()
                switch(x){
                case 3: sum = myStack.pop()! / myStack.pop()!
                case 4: sum = myStack.pop()! * myStack.pop()!
                default : count3 += 1
                }
                if(x == 3||x == 4){
                    myStack.push(element: sum)
                }
            }
            OmyStack.push(element: count)
            remember = true
            display.text = ""
            count1 += 1
    }
    }
    @IBAction func HZ(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
        } else
        {
            temp = Double(display.text!)!
            myStack.push(element: temp)
            for _ in 1...OmyStack.count{
            Calculation()
            }
            
            sum = myStack.pop()!
            count1 = 0
            display.text = "\(sum)"
        }
}
    @IBAction func negative(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
            display.text = "-"
        } else
        {
            if(display.text == "-")
            {
                display.text = ""
               return
            }
            if(remember)
            {
                temp1 = Int(display.text!)! * -1
                display.text = "\(temp1)"
            }
            else
            {
                temp = Double(display.text!)! * -1
                display.text = "\(temp)"
            }
        }
    }
    @IBAction func Hdot(_ sender: Any) {
        if(display.text == "")
        {
            remember = false
        }else
        {
            if(remember){
                display.text = display.text! + "."
            }
            remember = false
        }
    }
    func Calculation() -> () {
        let x = OmyStack.pop()
        switch(x){
        case 1: sum = myStack.pop()! + myStack.pop()!
        case 2: sum = myStack.pop()! - myStack.pop()!
        case 3: sum = myStack.pop()! / myStack.pop()!
        case 4: sum = myStack.pop()! * myStack.pop()!
        default : sum = 0
    }
      if(x == 2)
      {
        sum *= -1
    }
        if(x == 3)
        {
            sum = 1/sum
        }
    myStack.push(element: sum)
    }
    
    @IBAction func HAC(_ sender: Any) {
        display.text = ""
        remember = true
        sum = 0
        count1 = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
