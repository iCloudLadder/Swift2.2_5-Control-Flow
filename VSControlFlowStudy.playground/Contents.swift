//: Playground - noun: a place where people can play

import UIKit

// 控制流

/*
    Swift 提供了类似 C 语言的流程控制结构,包括可以多次执行任务的 for 和 while 循环,基于特定条件选择执行不同代码分支的 if 、 guard 和 switch 语句,还有控制流程跳转到其他代码的 break 和 continue 语句。
 
    除了 C 语言里面传统的 for 循环,Swift 还增加了 for-in 循环,用来更简单地遍历数组(array),字典(dic tionary),区间(range),字符串(string)和其他序列类型。
 
    Swift 的 switch 语句比 C 语言中更加强大。
    在 C 语言中,如果某个 case 不小心漏写了 break ,这个 case 就 会贯穿至下一个 case,Swift 无需写 break ,所以不会发生这种贯穿的情况。
    case 还可以匹配更多的类型模 式,包括区间匹配(range matching),元组(tuple)和特定类型的描述。
    switch 的 case 语句中匹配的值可以是由 case 体内部临时的常量或者变量决定,也可以由 where 分句描述更复杂的匹配条件。

 */



// >>  for 循环
/*
 for 有两种形式：
 • for-in循环对一个集合里面的每个元素执行一系列语句。(类似OC中的快速枚举)
 • for 循环,用来重复执行一系列语句直到达成特定条件达成,一般通过在每次循环完成后增加计数器的值来 实现。
 */




// for- in

let stringsArray = ["0", "1", "2", "3", "4"]
for item in stringsArray {
    print("string = \(item)")
}

// 当你不需要知道你要循环的 item 时，可以用 _ 下划线代替，来忽略对item的访问
var two = 2
for _ in 0...5
{
    two *= 2
}
two
// 关于 for-in 可以看看之前的 Collection Types章节



//  for 基本和其他语言类似
for var index = 0; index < 4; ++index {
    print("index = \(index)")
}





// >> While 循环
/*
 while 循环运行一系列语句直到条件变成 false 。
 这类循环适合使用在第一次迭代前迭代次数未知的情况下。
 
 Swift 提供两种 while 循环形式:
 • while循环,每次在循环开始时计算条件是否符合;
 • repeat-while循环,每次在循环结束时计算条件是否符合。
 */

// 1 While
/*
 语法：
 while condition {
    statements
 }
 */

var whileIndex = 0
while whileIndex < 3 {
    print("whileCount = \(whileIndex)")
    whileIndex += 1
    // ++whileIndex 在Xcode 7.3中，警告说Swift3中将不在存在，这种递增和递减的操作符
}


// 2 Repeat-While
/*
 类似其他语言的 do-while
 
 while 循环的另外一种形式是 repeat-while ,它和 while 的区别是在判断循环条件之前,先执行一次循环的代码 块,然后重复循环直到条件为 false 。
 
 语法：
 repeat {
    statements
 } while condition
 */

var rpIndex = 0

repeat {
    print("rpIndex = \(rpIndex)")
    rpIndex += 1
}while rpIndex < 4




// >> 条件语句
/*
 Swift 提供两种类型的条件语句: if 语句和 switch 语句。
 通常,当条件较为简单且可能的情况很少时,使用 i f 语句。
 而 switch 语句更适用于条件较复杂、可能情况较多且需要用到模式匹配(pattern-matching)的情境。
 */

// 1 if
// if 语句最简单的形式就是只包含一个条件,当且仅当该条件为 true 时,才执行相关代码
let aNumber = 10
if aNumber > 5 {
    print("aNumber more than five")
}
//  if 语句允许二选一,也就是当条件为 false 时,执行 else 语句

if aNumber > 15 {
    print("aNumber more than fifteen")
} else {
    print("aNumber less than fifteen")
}

// 当还有其他条件时，可以使用 else if 分支
if aNumber < 0 {
    print("aNumber less than 0")
} else if aNumber < 15 {
    print("aNumber more than 0, and less than 15")
} else {
    print("aNumber more than 15")
}



// Switch
/*
 switch 语句会尝试把某个值与若干个模式(pattern)进行匹配。根据第一个匹配成功的模式, switch 语句会执 行对应的代码。
 当有可能的情况较多时,通常用 switch 语句替换 if 语句。
 
 语法：
 switch some value to consider {
    case value 1:
        respond to value 1
    case value 2, value 3:
        respond to value 2 or 3
    default:
        otherwise, do something else
 }
 
 switch 语句必须是完备的。这就是说,每一个可能的值都必须至少有一个 case 分支与之对应。在某些不可能涵 盖所有值的情况下,你可以使用默认( default )分支满足该要求,这个默认分支必须在 switch 语句的最后面。
 
 case 语句后不需要 break
 */

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

/*
 一个 case 也可以包含多个模式,用逗号把它们分开(如果太长了也可以分行写)
 
 switch some value to consider {
    case value 1, value 2:
        statements
 }

 */


// 区间匹配 case 分支的模式也可以是一个值的区间。
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
/*
 闭区间操作符(...)以及半开区间操作符(..<)功能被重载去返回 IntervalType 或 Range 。
 一个区间可以决定他是否包含特定的元素,就像当匹配一个 switch 声明的 case 一样。
 区间是一个连续值的集合,可以 用  for-in 语句遍历它。
 */


/*
 元组(Tuple)
 我们可以使用元组在同一个 switch 语句中测试多个值。元组中的元素可以是值,也可以是区间。
 另外,使用下划 线( _ )来匹配所有可能的值。
 */
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}


/*
 值绑定(Value Bindings)
 case 分支的模式允许将匹配的值绑定到一个临时的常量或变量,这些常量或变量在该 case 分支里就可以被引用 了——这种行为被称为值绑定(value binding)。
 */

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}


// Where, case 分支的模式可以使用 where 语句来判断额外的条件。
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}




// >> 控制转移语句
/*
 控制转移语句改变你代码的执行顺序,通过它你可以实现代码的跳转。
 
 Swift 有五种控制转移语句:
 • continue
 • break
 • fallthrough
 • return
 • throw
 */


// continue
/*
 告诉一个循环体立刻停止本次循环迭代,重新开始下次循环迭代。
 
 在一个带有条件和递增的for循环体中,调用 continue 语句后,迭代增量仍然会被计算求值。
 循环体继 续像往常一样工作,仅仅只是循环体中的执行代码会被跳过。
 */
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}



// Break
/*
 break 语句会立刻结束整个控制流的执行。当你想要更早的结束一个 switch 代码块或者一个循环体时,你都可以 使用 break 语句。
 
 
 循环语句中的 break
 当在一个循环体中使用 break 时,会立刻中断该循环体的执行,然后跳转到表示循环体结束的大括号( } )后的第 一行代码。不会再有本次循环迭代的代码被执行,也不会再有下次的循环迭代产生。
 
 
 Switch 语句中的 break
 当在一个 switch 代码块中使用 break 时,会立即中断该 switch 代码块的执行,并且跳转到表示 switch 代码块 结束的大括号( } )后的第一行代码。
 当一个 switch 分支仅仅包含注释时,会被报编译时错误。注释不是代码语句而且也不能让 switch 分支 达到被忽略的效果。你总是可以使用 break 来忽略某个分支。
 */

let numberSymbol: Character = "三" // 简体中文里的数字 3 
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "一":
    possibleIntegerValue = 1
case "2", "二":
    possibleIntegerValue = 2
case "3", "三":
    possibleIntegerValue = 3
case "4", "四":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}



// Fallthrough
/*
 Swift 中的 switch 不会从上一个 case 分支落入到下一个 case 分支中。相反,只要第一个匹配到的 case 分支 完成了它需要执行的语句,整个 switch 代码块完成了它的执行。相比之下,C 语言要求你显式地插入 break 语句 到每个 switch 分支的末尾来阻止自动落入到下一个 case 分支中。Swift 的这种避免默认落入到下一个分支中的 特性意味着它的 switch 功能要比 C 语言的更加清晰和可预测,可以避免无意识地执行多个 case 分支从而引发 的错误。
 
 
 fallthrough 关键字不会检查它下一个将会落入执行的 case 中的匹配条件。
 fallthrough 简单地使代 码执行继续连接到下一个 case 中的执行代码,这和 C 语言标准中的 switch 语句特性是一样的。
 */

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)












// >> 带标签的语句
/*
 在 Swift 中,你可以在循环体和 switch 代码块中嵌套循环体和 switch 代码块来创造复杂的控制流结构。然 而,循环体和 switch 代码块两者都可以使用 break 语句来提前结束整个方法体。因此,显式地指明 break 语句 想要终止的是哪个循环体或者 switch 代码块,会很有用。类似地,如果你有许多嵌套的循环体,显式指明 conti nue 语句想要影响哪一个循环体也会非常有用。
 
 
 为了实现这个目的,你可以使用标签来标记一个循环体或者 switch 代码块,当使用 break 或者 continue 时,带 上这个标签,可以控制该标签代表对象的中断或者执行。
 
 
 产生一个带标签的语句是通过在该语句的关键词的同一行前面放置一个标签,并且该标签后面还需带着一个冒 号
 */


var number = arc4random_uniform(10)

BreakLabel: for _ in 0..<10 {
    switch number {
    case let num where num % 3 == 0:
        print("break loop number = \(number)")
        break BreakLabel // 如果break不实用 标签BreakLabel，中断的则是 switch 语句，循环会执行10此
    default:
        print("number = \(number)")
    }
    number = arc4random_uniform(3)
}



// >> guard 提前退出

/*
 像 if 语句一样, guard 的执行取决于一个表达式的布尔值。我们可以使用 guard 语句来要求条件必须为真 时,以执行 guard 语句后的代码。不同于 if 语句,一个 guard 语句总是有一个 else 分句,如果条件不为真则执 行 else 分句中的代码
 */

func testGuard(aValue: String?) {
    guard aValue != nil else {
        print("aValue is nil")
        return
    }
    print("The value is \(aValue!)")
}
testGuard(nil)
testGuard("Swift")

var evenNumberCount = 0
for index in 0...10
{
    guard index % 2 == 0 else {
        continue
    }
    evenNumberCount += 1
}
evenNumberCount






// >> 检测 API 可用性

/*
if #available(platform name version, ..., *) {
    statements to execute if the APIs are available
} else {
    fallback statements to execute if the APIs are unavailable
}
 
 最后一个参数, * ,是必须写的,用于处理未来潜在的平台。

 
 
 */

if #available(iOS 9, OSX 10.10, *) {
    // 在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API
} else {
    // 使用先前版本的 iOS 和 OS X 的 API
}











