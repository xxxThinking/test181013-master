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

//思想：
//栈中寄存加减和get得到的乘除法计算得的值 乘除由后面的符号利用peek（）偷看栈顶的到并计算进栈

class ViewController: UIViewController {

    var temp:Double = 0  //屏幕输入的数字
    var remember: Bool = true //小数点
    var count = 0 //符号标示
    var count3 = 0//记录乘除前加减号
    var get : Double = 1 //栈外计算
    var countFrist = 0  //记录第一个数字
    var countNegative = 0  //记录乘除加法前是否有减号
    var countget = 0 //记录 = 号调用次数
    @IBOutlet weak var display: UITextField!
    @IBOutlet weak var displaypeek: UITextField!
    @IBAction func H1(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "1"
        displaypeek.text = displaypeek.text! + "1"
    }
    @IBAction func H2(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "2"
        displaypeek.text = displaypeek.text! + "2"
    }
    @IBAction func H3(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "3"
        displaypeek.text = displaypeek.text! + "3"
    }
    @IBAction func H4(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "4"
        displaypeek.text = displaypeek.text! + "4"
    }
    @IBAction func H5(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text!  + "5"
        displaypeek.text = displaypeek.text! + "5"
    }
    @IBAction func H6(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "6"
        displaypeek.text = displaypeek.text! + "6"
    }
    @IBAction func H7(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "7"
        displaypeek.text = displaypeek.text! + "7"
    }
    @IBAction func H8(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "8"
        displaypeek.text = displaypeek.text! + "8"
    }
    @IBAction func H9(_ sender: Any) {
        if(display.text == "0")
        {
            display.text = ""
        }
        display.text = display.text! + "9"
        displaypeek.text = displaypeek.text! + "9"
    }
    @IBAction func H0(_ sender: Any) {
        display.text = display.text! + "0"
        displaypeek.text = displaypeek.text! + "0"
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
            if(OmyStack.peek() == 2 ){//判断乘除加法前是否有减号 有则置为负数 进栈
                temp *= -1
                myStack.push(element: temp)
                countNegative += 1
            }else{
                myStack.push(element: temp)
            }
            
            if(countFrist == 0){  //判断是否为开头输入的元素
                OmyStack.push(element: count)
            }else{
                let x = OmyStack.peek()! //偷看前面是什么符号
            if(x == 3 || x == 4) //如果是乘除的话将乘除符号出栈
            {
                let _ = OmyStack.pop()!  //该符号前面为乘除法运算则f符号出栈
            }
                switch(x){
                    case 3: get = myStack.pop()! / myStack.pop()!
                    case 4: get = myStack.pop()! * myStack.pop()!
                    default : count3 += 1  //判断是加减号
                    }
                if(x == 3||x == 4){  //乘除运算的值进栈
                    if(x == 3) //判断为除号需要置换get为倒数
                    {
                        get = 1/get
                    }
                    print(get)
                    myStack.push(element: get)
                    get = 1 //进栈后重置总值
                }
                OmyStack.push(element: count)
            }
            displaypeek.text = displaypeek.text! + "+"
            remember = true //记录小数点是否输入
            display.text = ""  //清空屏幕
            countFrist += 1 //记录输入次数 便于查看是否为第一次输入
        }
    }
    @IBAction func reduce(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
            
        } else
        {
            count = 2
            temp = Double(display.text!)!
            if(OmyStack.peek() == 2 ){//判断乘除加法前是否有减号 有则置为负数 进栈
                temp *= -1
                myStack.push(element: temp)
                countNegative += 1
            }else{
                myStack.push(element: temp)
            }
            
            if(countFrist == 0){
                OmyStack.push(element: count)
                
            }else{
                let x = OmyStack.peek()!
            if(x == 3 || x == 4) //如果是乘除的话将乘除符号出栈
            {
                let _ = OmyStack.pop()!
            }
                switch(x){
                    case 3: get = myStack.pop()! / myStack.pop()!
                    case 4: get = myStack.pop()! * myStack.pop()!
                    default : count3 += 1
                    }
                if(x == 3||x == 4){
                    if(x == 3)
                    {
                        get = 1/get
                    }
                    print(get)
                    myStack.push(element: get)
                    get = 1
                }
                OmyStack.push(element: count)
            }
            displaypeek.text = displaypeek.text! + "-"
            remember = true
            display.text = ""
            countFrist += 1
        }
    }
    @IBAction func division(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
            
        } else
        {
            count = 3
            temp = Double(display.text!)!
            if(OmyStack.peek() == 2 ){//判断乘除加法前是否有减号 有则置为负数 进栈
                temp *= -1
                myStack.push(element: temp)
                countNegative += 1
            }else{
                myStack.push(element: temp)
            }
            
            if(countFrist == 0){
                get = myStack.pop()!
                myStack.push(element: get)
                get = 1
            }else{
                let x = OmyStack.peek()!
                if(x == 3 || x == 4) //如果是乘除的话将乘除符号出栈
                {
                    let _ = OmyStack.pop()!
                }
                switch(x){
                case 3: get = myStack.pop()! / myStack.pop()!
                case 4: get = myStack.pop()! * myStack.pop()!
                default : count3 += 1
                }
                if(x == 3||x == 4){
                    if(x == 3)
                    {
                        get = 1/get
                    }
                    print(get)
                    myStack.push(element: get)
                }
            }
            displaypeek.text = displaypeek.text! + "/"
            OmyStack.push(element: count)
            remember = true
            display.text = ""
            countFrist += 1
        }
    }
    @IBAction func multiplication(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
            
        } else
        {
            count = 4
            temp = Double(display.text!)!
            if(OmyStack.peek() == 2 ){  //判断乘除加法前是否有减号 有则置为负数 进栈
                temp *= -1
                myStack.push(element: temp)
                countNegative += 1
                print(temp)
            }else{
                myStack.push(element: temp)
            }
            
            if(countFrist == 0){
                get = myStack.pop()!
                myStack.push(element: get)
                get = 1
            }else {
                let x = OmyStack.peek()!
                if(x == 3 || x == 4) //如果是乘除的话将乘除符号出栈
                {
                    let _ = OmyStack.pop()!
                }
                switch(x){
                case 3: get = myStack.pop()! / myStack.pop()!
                case 4: get = myStack.pop()! * myStack.pop()!
                default : count3 += 1
                }
                if(x == 3||x == 4){
                    if(x == 3)
                    {
                        get = 1/get
                    }
                    print(get)
                    myStack.push(element: get)
                    get = 1
                }
            }
            displaypeek.text = displaypeek.text! + "*"
            OmyStack.push(element: count)
            remember = true
            display.text = ""
            countFrist += 1
    }
    }
    @IBAction func equa(_ sender: Any) {
        if(display.text == "0" || display.text == "")
        {
        } else
        {
            if(countget == 0){//判断等号输入次数做"="前计算
            temp = Double(display.text!)!
            if(OmyStack.peek() == 2 ){
                temp *= -1
                myStack.push(element: temp)
                countNegative += 1
            }else{
                myStack.push(element: temp)
            }
            for _ in 1...OmyStack.count{
                Calculation()
            }
                remember = false
            }else //否则做等号后计算
            {
                temp = Double(display.text!)!
                if(OmyStack.peek() == 2 ){
                    temp *= -1
                    myStack.push(element: temp)
                    countNegative += 1
                }else{
                    myStack.push(element: temp)
                }
                for _ in 1...OmyStack.count{
                    Calculation()
            }
                remember = false
            }
            get = myStack.pop()! //得到get出栈
            display.text = "\(get)" //显示
            myStack.push(element: get) //再入栈以做“=”后计算
            countFrist = 0 //清零首数字计数
            print(get)//显示
            countget += 1 //记录等号使用次数
            displaypeek.text = displaypeek.text! + " "
        }
}
    //正负号转换
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
                temp = Double(display.text!)! * -1
                display.text = "\(temp)"
        }
    }
    //小数点
    @IBAction func Hdot(_ sender: Any) {
        if(display.text == "")
        {
            remember = false
        }else
        {
            if(remember){
                display.text = display.text! + "."
                displaypeek.text = displaypeek.text! + "."
            }
            remember = false
        }
    }
    
    //计算函数
    func Calculation() -> () {
        if(OmyStack.count != 1){ //已经得到同级运算和负数 所以最后一定做加法运算
        let x = OmyStack.pop()! //减号有特殊性所以分开考虑
        switch(x){
        case 1: get = myStack.pop()! + myStack.pop()!
        case 3: get = myStack.pop()! / myStack.pop()!
        case 4: get = myStack.pop()! * myStack.pop()!
        default : countFrist += 1  //无用变量使用当替罪羊
    }
        if(x == 2)
        {
            if(countNegative == 0){
                get = myStack.pop()! - myStack.pop()! //当没有负数时
            }else{
                get = myStack.pop()! + myStack.pop()! //有负数时计算
            }
        }
            if(x == 3)
            {
                get = 1/get
            }
        } else{
            let y = OmyStack.pop()!
                switch(y){
                case 3: get = myStack.pop()! / myStack.pop()! //等号后计算使用
                case 4: get = myStack.pop()! * myStack.pop()!  //等号后计算使用
                default : get = myStack.pop()! + myStack.pop()!  //加法运算
                }
            if(y == 3)
            {
                get = 1/get
            }
        }
        myStack.push(element: get)  //计算一次入一次栈
    }
    
    @IBAction func HAC(_ sender: Any) {
        display.text = ""  //清空屏幕
        remember = true //重置可以输入小数点次数
        get = 0 //清零总值
        countFrist = 0 //清零判断首数字
        countNegative = 0 //清零式子中负数
        count3 = 0 //清零记录乘除前加减号
        displaypeek.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
