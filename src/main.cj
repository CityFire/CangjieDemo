package CangjieDemo
import std.random.*
import net.http.*
import std.socket.*
import std.time.*
import std.sync.*
import encoding.url.*
import std.collection.*
import std.log.*
import std.sync.SyncCounter
import std.console.*
import std.fs.*
// 创建
internal import std.fs.*
import std.io.*
import std.collection.*

func a() {
    let b = 2023
    func c() {
        println(b)
    }
    c()
}

class A {
    let b = 2024
    public func c() {
        println(b)
    }
}

struct Copy {
    var data = 2012
}

class Share {
    var data = 2012
}

func add(a!: Int64 = 1, b!: Int64 = 1): Int64 { // 命名参数  非命名参数只能定义在命名参数之前，也就意味着命名参数之后不能再出现非命名参数。
    return a + b 
}

let element = "仓颉"
let SERVER_PORT: UInt16 = 8080

let server = ServerBuilder()
                 .addr("127.0.0.1")
                 .port(0)
                 .build()

let count = AtomicInt64(0)
var cout: Int64 = 0
let mtx = ReentrantMutex()

var mon = Monitor()
var flag: Bool = true


func foo2() {
    mtx.lock()
    cout += 10
    bar()
    mtx.unlock()
}

func bar() {
    mtx.lock()
    cout += 100
    mtx.unlock()
}

class R <: Resource {
    public func isClosed(): Bool {
        true
    }
    public func close(): Unit {
        print("R is closed")
    }
}

open class Father <: Exception {
    var father: Int32 = 0
}

class ChildOne <: Father {
    var childOne: Int32 = 1
}

class ChildTwo <: Father {
    var childTwo: Int32 = 2
}

struct AA {
    let b: BB = BB()
}

struct BB {
    let c: Option<CC> = CC()
    let c1: Option<CC> = Option<CC>.None
}

struct CC {
    let d: Int64 = 100
}

func translate(n: Rune) {
    match (n) {
        case "一" => 1
        case "二" => 2
        case "三" => 3
        case _ => -1
    }
}

func translate_(n: Byte) {
    match (n) {
        case "1" => 1
        case "2" => 2
        case "3" => 3
        case _ => -1
    }
}

open class Base {
    var a: Int64
    public init() {
        a = 10
    }
}

class Derived <: Base {
    public init() {
        a = 20
    }
}

enum TimeUnit {
    | Year(UInt64)
    | Month(UInt64)
}

enum Command {
    | SetTimeUnit(TimeUnit)
    | GetTimeUnit
    | Quit
}

func constPat(x: Int64) {
    match (x) {
        case 1 => "one"
        case 2 => "two"
        case _ => "_"
    }
}

func wildcardPat(x: Int64) {
    match (x) {
        case _ => "_"
    }
}

func varPat(x: Int64) {
    match (x) {
        case a => "x = ${a}"
    }
}

func tuplePat(x: (Int64, Int64)) {
    match (x) {
        case (1, 2) => "(1, 2)"
        case (a, 2) => "(${a}, 2)"
        case (a, b) => "(${a}, ${b})"
    }
}

interface I {}
open class Base_ <: I {}
class Derived_ <: Base_ {}

func typePat(x: I) {
    match (x) {
        case a: Derived_ => "Derived"
        case b: Base_ => "Base"
        case _ => "Other"
    }
}

enum E1 {
    A(Int64)
}

enum E2 {
    B(Int64) | C(Int64)
}

func enumPat1(x: E1) {
    match (x) {
        case A(1) => "A(1)"
        case A(a) => "A(${a})"
    }
}

func enumPat2(x: E2) {
    match (x) {
        case B(b) => "B(${b})"
        case C(c) => "C(${c})"
    }
}

func nonExhaustive(x: Int64) {
    match (x) {
        case 0 => print("x = 0")
        case 1 => print("x = 1")
        case 2 => print("x = 2")
        case _ => print("none")
    }
}

enum RGBColor_ {
    | Red_(Int16) | Green_(Int16) | Blue_(Int16)
}

enum RedColor {
    _Red(Int64)
}

// 此函数模拟在通信中接收数据，获取数据可能失败
func recv(): Option<UInt8> {
    let number = Random().nextUInt8()
    if (number < 128) {
        return Some(number)
    }
    return None
}

class Rectangle_ {
    static let degree: Int64
    static init() {
        degree = 180
    }
}

class Rectangle {
    let width: Int64
    let height: Int64

    public init(width: Int64) {
        this.width = width
        this.height = width
    }

    public init(width: Int64, height: Int64) { // Ok: overloading with the first init function
        this.width = width
        this.height = height
    }

    // public Rectangle(let width: Int64, let height: Int64) {}

    // public Rectangle(name: String, let width: Int64, let height: Int64) {}

    // public init(height: Int64) { // Error, redefinition with the first init function
    //     this.width = height
    //     this.height = height
    // }

    public func area() {
        this.width * this.height
    }

    public static func typeName(): String {
        "Rectangle"
    }
}

// 抽象类 AbRectangle（使用关键字 abstract 修饰）中定义了抽象函数 foo。
abstract class AbRectangle {
    public func foo(): Unit
}

public sealed abstract class C1 {}   // Warning, redundant modifier, 'sealed' implies 'public'
sealed open abstract class C2 {}     // Warning, redundant modifier, 'sealed' implies 'open'
sealed abstract class C3 {}          // OK, 'public' is optional when 'sealed' is used

class S1 <: C1 {}  // OK
public open class S2 <: C1 {}   // OK
public sealed abstract class S3 <: C1 {}  // OK
open class S4 <: C1 {}   // OK

class SS1 <: S2 {}  // OK
class SS2 <: S3 {}  // Error, S3 is sealed class, cannot be inherited here.
// sealed class SS3 {} // Error, 'sealed' cannot be used on non-abstract class.


open class AAAA {
    public open func f(): Unit {
        println("I am superclass")
    }

    public static func foo(): Unit {
        println("I am class AAAA")
    }
}

class BBBB <: AAAA {
    public override func f(): Unit {
        println("I am subclass")
    }

    public redef static func foo(): Unit {
        println("I am class BBBB")
    }
}

/*
open class A {}
open class B <: A {}
open class C <: B {}

open class Base {
    static func f<T>(a: T): Unit where T <: B {}
    static func g<T>(): Unit where T <: B {}
}

class D <: Base {
    redef static func f<T>(a: T): Unit where T <: C {} // Error, stricter constraint
    redef static func g<T>(): Unit where T <: C {} // Error, stricter constraint
}

class E <: Base {
    redef static func f<T>(a: T): Unit where T <: A {} // OK: looser constraint
    redef static func g<T>(): Unit where T <: A {} // OK: looser constraint
}

class F <: Base {
    redef static func f<T>(a: T): Unit where T <: B {} // OK: same constraint
    redef static func g<T>(): Unit where T <: B {} // OK: same constraint
}
*/

interface III { // 'open' modifier is optional.
    func f(): Unit
}

class Foo <: III {
    public func f(): Unit {
        println("Foo")
    }
}

interface Flyable {
    func fly(): Unit
}

class Bird <: Flyable {
    public func fly(): Unit {
        println("Bird flying")
    }
}

class Bat <: Flyable {
    public func fly(): Unit {
        println("Bat flying")
    }
}

class Airplane <: Flyable {
    public func fly(): Unit {
        println("Airplane flying")
    }
}

func fly(item: Flyable): Unit {
    item.fly()
}

interface NamedType {
    // static func typename(): String
    static func typename(): String {
        "interface NamedType"
    }
}

interface IIIIII <: NamedType {
    static func typename(): String {
        f()
    }
    static func f(): String
}


class AAAAAA <: NamedType {
    public static func typename(): String {
        "A"
    }
}

class BBBBBB <: NamedType {
    public static func typename(): String {
        "B"
    }
}
class CCCCCC <: NamedType {}

func printTypeName<T>() where T <: NamedType {
    println("the type is ${ T.typename() }")
}

interface Addable {
    func add(other: Int64): Int64
}

interface Subtractable {
    func sub(other: Int64): Int64
}

class MyInt <: Addable & Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }
}

// 接口继承
interface Calculable <: Addable & Subtractable {
    func mul(other: Int64): Int64
    func div(other: Int64): Int64
}

class MyInt_ <: Calculable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }
    public func mul(other: Int64): Int64 {
        value * other
    }
    public func div(other: Int64): Int64 {
        value / other
    }
}

interface I1 {
   func f(a: Int64) {
        a
   }
   static func g(a: Int64) {
        a
   }
   func f1(a: Int64): Unit
   static func g1(a: Int64): Unit
}

interface I2 <: I1 {
    /*'override' is optional*/ func f(a: Int64) {
       a + 1
    }
    // override func f(a: Int32) {} // Error, override function 'f' does not have an overridden function from its supertypes
    static /*'redef' is optional*/ func g(a: Int64) {
       a + 1
    }
    /*'override' is optional*/ func f1(a: Int64): Unit {}
    static /*'redef' is optional*/ func g1(a: Int64): Unit {}
}

class C_ {
    var p: CString

    init(s: String) {
        p = unsafe { LibC.mallocCString(s) }
        println(s)
    }
    ~init() {
        unsafe { LibC.free(p) }
    }
}

// client:
main(): Int64 {
    println("hello 仓颉")
    a()
    A().c()

    let a: Int64 = 20
    var b: Int64 = 12
    b = 23
    println("${a}${b}")

    let c: Int64 = 2023
    let d = c
    println("c - d = ${c - d}")

    let text: String
    text = "仓颉造字"
    println(text)

    let c1 = Copy()
    var c2 = c1
    c2.data = 2023
    println("${c1.data}, ${c2.data}")

    let s1 = Share()
    let s2 = s1
    s2.data = 2023
    println("${s1.data}, ${s2.data}")

    println(element)
    let element = 9
    if (element > 0) {
        let element = 2023
        println(element)
    }
    println(element)

    let number: Int8 = Random().nextInt8()
    println(number)
    if (number % 2 == 0) {
        println("偶数")
    } else {
        println("奇数")
    }

    let zero: Int8 = 0
    let one: Int8 = 1
    let voltage = 5.0
    let bit = if (voltage < 2.5) {
        zero
    } else {
        one
    }

    var root = 0.0
    var min = 1.0
    var max = 2.0
    var error = 1.0
    let tolerance = 0.1 ** 10

    while (error ** 2 > tolerance) {
        root = (min + max) / 2.0
        error = root ** 2 - 2.0
        if (error > 0.0) {
            max = root
        } else {
            min = root
        }
    }
    println("2 的平方根约等于：${root}")

    let random = Random()
    var totalPoints = 0
    var hitPoints = 0

    do {
        // 在 ((0, 0), (1, 1)) 这个正方形中随机取点
        let x = random.nextFloat64()
        let y = random.nextFloat64()
        // 判断是否落在正方形内接圆里
        if ((x - 0.5) ** 2 + (y - 0.5) ** 2 < 0.25) {
            hitPoints++
        }
        totalPoints++
    } while (totalPoints < 1000000)

    let pi = 4.0 * Float64(hitPoints) / Float64(totalPoints)
    println("圆周率近似值为：${pi}")

    let metaArray = [r'甲', r'乙', r'丙', r'丁', r'戊',
        r'己', r'庚', r'辛', r'壬', r'癸']
    let noumenonArray = [r'寅', r'卯', r'辰', r'巳', r'午', r'未',
        r'申', r'酉', r'戌', r'亥', r'子', r'丑']
    let year = 2024
    // 年份对应的天干索引
    let metaOfYear = ((year % 10) + 10 - 4) % 10
    // 此年首月对应的天干索引
    var index = (2 * metaOfYear + 3) % 10 - 1
    println("农历 2024 年各月干支：")
    for (noumenon in noumenonArray) {
        print("${metaArray[index]}${noumenon} ")
        index = (index + 1) % 10
    }

    var sum = 0
    for (i in 1..=100) {
        sum += i
    }
    println(sum)

    let array = [(1, 2), (3, 4), (5, 6)]
    for ((x, y) in array) {
        println("${x}, ${y}")
    }

    for (i in 0..8 where i % 2 == 1) { // i 为奇数才会执行循环体
        println(i)
    }

    let p1 = 2 ** 3               // p1 = 8
    let p2 = 2 ** UInt64(3 ** 2)  // p2 = 512
    let p3 = 2.0 ** 3.0           // p3 = 8.0
    let p4 = 2.0 ** 3 ** 2        // p4 = 512.0
    let p5 = 2.0 ** 3.0           // p5 = 8.0
    let p6 = 2.0 ** 3.0 ** 2.0    // p6 = 512.0

    let r = add()
    println("The sum is ${r}")

    let x = 1
    let y = 2
    let z = add(b: y, a: x)
    println("The sum of x and y is ${z}")

    let fruitPriceHandler: (name: String, price: Int64) -> Unit 
    fruitPriceHandler = {n, p => println("fruit: ${n} price: ${p} yuan")}
    fruitPriceHandler("banana", 10)

    var aa = returnAdd()
    println(aa(1, 2))

    var bb = printAdd(add, 3, 5)
    println(bb)

    let f = foo()
    let xx = f(1, 8)
    println("result: ${xx}")

    let f1 = { a: Int64, b: Int64 => a + b }
    var display = { => println("Hello") }

    func f2(Lam: () -> Unit) { }
    let f2Res = f2{ println("World") }

    var sum1: (Int64, Int64) -> Int64 = { a, b => a + b }
    var sum2: (Int64, Int64) -> Int64 = { a: Int64, b => a + b }

    // f({ a2 => a2 + 10 })


    let fut: Future<Unit> = spawn { =>
       println("New thread before sleeping")
       sleep(100 * Duration.millisecond) // sleep for 100ms.
       println("New thread after sleeping")
    }

    println("New thread id: ${fut.thread.id}")

    // fut.get()

    println("Main thread")

    fut.get() // wait for the thread to finish.

    let future: Future<Int64> = spawn {
        sleep(Duration.second) // sleep for 1s.
        println("Current thread id: ${Thread.currentThread.id}")
        return 1
    }

    try {
        // wait for the thread to finish, and get the result.
        let res: Int64 = future.get()
        println("result = ${res}")
    } catch (_) {
        println("oops")
    }

    // wait for the thread to finish, but only for 1ms.
    let res: Option<Int64> = future.get(1000 * 1000)
    match (res) {
        case Some(val) => println("result = ${val}")
        case None => println("oops")
    }

    let syncCounter = SyncCounter(1)
    let futu = spawn {
        syncCounter.waitUntilZero()
        // Check cancellation request
        if (Thread.currentThread.hasPendingCancellation) {
            println("cancelled")
            return
        }
        println("hello")
    }
    futu.cancel() // Send cancellation request
    syncCounter.dec()
    futu.get() // Join thread


    let list = ArrayList<Future<Int64>>()

    // create 1000 threads.
    for (i in 0..1000) {
        let fut = spawn {
            sleep(Duration.millisecond) // sleep for 1ms.
            count.fetchAdd(1)
        }
        list.append(fut)
    }

    // Wait for all threads finished.
    for (f in list) {
        f.get()
    }

    let val = count.load()
    println("count = ${val}")

    let list2 = ArrayList<Future<Unit>>()

    // creat 1000 threads.
    for (i in 0..1000) {
        let fut = spawn {
            sleep(Duration.millisecond) // sleep for 1ms.
            mtx.lock()
            cout++
            mtx.unlock()
        }
        list2.append(fut)
    }

    // Wait for all threads finished.
    for (f in list2) {
        f.get()
    }

    println("cout = ${cout}")


    let fut2 = spawn {
        sleep(Duration.millisecond) // sleep for 1ms.
        foo2()
    }

    foo2()

    fut2.get()

    println("cout = ${cout}")


    let fut3 = spawn {
        mon.lock()
        while (flag) {
            println("New thread: before wait")
            mon.wait()
            println("New thread: after wait")
        }
        mon.unlock()
    }

    // Sleep for 10ms, to make sure the new thread can be executed.
    sleep(10 * Duration.millisecond)

    mon.lock()
    println("Main thread: set flag")
    flag = false
    mon.unlock()

    mon.lock()
    println("Main thread: notify")
    mon.notifyAll()
    mon.unlock()

    // wait for the new thread finished.
    fut3.get()


    let list4 = ArrayList<Future<Unit>>()

    // creat 1000 threads.
    for (i in 0..1000) {
        let fut = spawn {
            sleep(Duration.millisecond) // sleep for 1ms.
            // Use synchronized(mtx), instead of mtx.lock() and mtx.unlock().
            synchronized(mtx) {
                cout++
            }
        }
        list4.append(fut)
    }

    // Wait for all threads finished.
    for (f in list4) {
        f.get()
    }

    println("cout = ${cout}")

    let tl = ThreadLocal<Int64>()
    let fut11 = spawn {
        tl.set(123)
        println("tl in spawn1 = ${tl.get().getOrThrow()}")
    }
    let fut22 = spawn {
        tl.set(456)
        println("tl in spawn2 = ${tl.get().getOrThrow()}")
    }
    fut11.get()
    fut22.get()


    // let txt = Console.stdIn.readln()
    // println(txt ?? "")

    for (i in 0..100) {
        Console.stdOut.writeln("hello, world!")
    }
    Console.stdOut.flush()

    // let exist = File.exists("./tempFile.txt")
    // println("exist: ${exist}")

    // File.copy("./tempFile.txt", "./tempFile2.txt", false)
    // File.move("./tempFile2.txt", "./tempFile3.txt", false)
    // File.delete("./tempFile3.txt")

    // let bytes = File.readFrom("./tempFile.txt") // 一次性读取了所有的数据
    // File.writeTo("./otherFile.txt", bytes) // 把数据一次性写入另一个文件中
    
    // let file = File.create("./tempFile.txt")
    // file.write("hello, world!".toArray())

    // 打开
    // let file2 = File.openRead("./tempFile.txt")
    // let bytes = file2.readToEnd() // 读取所有数据
    // println(bytes)

    // 使用指定选项打开文件
    // let file3 = File("./tempFile.txt", OpenOption.Truncate(false))
    // try (file2 = File.openRead("./tempFile.txt")) {
    //     // 结束使用后自动释放文件
    // }

    let arr1 = "0123456789".toArray()
    let byteArrayStream = ByteArrayStream()
    byteArrayStream.write(arr1)
    let bufferedInputStream = BufferedInputStream(byteArrayStream)
    let arr2 = Array<Byte>(20, item: 0)

    /* 读取流中数据，返回读取到的数据的长度 */
    let readLen = bufferedInputStream.read(arr2)
    println(String.fromUtf8(arr2[..readLen])) // 0123456789

    let arr11 = "01234".toArray()
    let byteArrayStream1 = ByteArrayStream()
    byteArrayStream1.write(arr11)
    let bufferedOutputStream = BufferedOutputStream(byteArrayStream1)
    let arr22 = "56789".toArray()

    /* 向流中写入数据，此时数据在外部流的缓冲区中 */
    bufferedOutputStream.write(arr22)

    /* 调用 flush 函数，真正将数据写入内部流中 */
    bufferedOutputStream.flush()
    println(String.fromUtf8(byteArrayStream1.readToEnd())) // 0123456789

    let arr21 = "012\n346789".toArray()
    let byteArrayStream2 = ByteArrayStream()
    byteArrayStream2.write(arr21)
    let stringReader = StringReader(byteArrayStream2)

    /* 读取一行数据 */
    let line = stringReader.readln()
    println(line ?? "error") // 012
    

    let byteArrayStream3 = ByteArrayStream()
    let stringWriter = StringWriter(byteArrayStream3)

    /* 写入字符串 */
    stringWriter.write("number")

    /* 写入字符串并自动转行 */
    stringWriter.writeln(" is:")

    /* 写入数字 */
    stringWriter.write(100.0f32)

    stringWriter.flush()

    println(String.fromUtf8(byteArrayStream3.readToEnd())) // number is:\n100.000000

    try {
        throw NegativeArraySizeException("I am an Exception!")
    } catch (e: NegativeArraySizeException) {
        println(e)
        println("NegativeArraySizeException is caught!")
    }

    try {
        throw NegativeArraySizeException("I am an Exception!")
    } catch (e: NegativeArraySizeException) {
        println(e)
        // let e = 0 // Error, redefinition
        // println(e)
        println("NegativeArraySizeException is caught!")
    }
    println("This will also be printed!")

    try {
        throw NegativeArraySizeException("NegativeArraySizeException")
    } catch (e: NegativeArraySizeException) {
        println("Exception info: ${e}.")
    } finally {
        println("The finally block is executed.")
    }

    try (r = R()) {
        println("Get the resource")
    } catch (e: Exception) {
        println("Exception happened when executing the try-with-resources expression")
    } finally {
        println("End of the try-with-resources expression")
    }

    try {
        throw IllegalArgumentException("This is an Exception!")
    } catch (e: OverflowException) {
        println(e.message)
        println("OverflowException is caught!")
    } catch (e: IllegalArgumentException | NegativeArraySizeException) {
        println(e.message)
        println("IllegalArgumentException or NegativeArraySizeException is caught!")
    } finally {
        println("finally is executed!")
    }

    try {
        throw ChildOne()
    } catch (e: ChildTwo | ChildOne) {
        println("ChildTwo or ChildOne?")
    }

    // Catch with wildcardPattern.
    try {
        throw OverflowException()
    } catch (_) {
        println("catch an exception!")
    }

    let a00 = Some(1)
    let b00: ?Int64 = None
    let r100 = getString(a00)
    let r200 = getString(b00)
    println(r100)
    println(r200)    

    let a111 = Some(1)
    let b111: ?Int64 = None
    let r111: Int64 = a111 ?? 0
    let r222: Int64 = b111 ?? 0
    println(r111)
    println(r222)

    let rr = RR(100)
    let xr = Some(rr)
    let yr = Option<RR>.None
    let r1r = xr?.a   // r1 = Option<Int64>.Some(100)
    let r2r = yr?.a   // r2 = Option<Int64>.None
    println(r1r)
    println(r2r)

    let aq = Some(AA())
    let aq1 = aq?.b.c?.d // a1 = Option<Int64>.Some(100)
    let aq2 = aq?.b.c1?.d // a2 = Option<Int64>.None
    println(aq1)
    println(aq2)

     let azz = Some(1)
    let bzz: ?Int64 = None
    let r1zz = azz.getOrThrow()
    println(r1zz)
    try {
        let r2zz = bzz.getOrThrow()
    } catch (e: NoneValueException) {
        println("bzz is None")
    }

    let rrr = RGBColor.Red 
    let ggg = Green
    let bbb = Blue(100)

    // let a: Option<Int64> = Some(100)
    // let b: ?Int64 = Some(100)
    // let c: Option<String> = Some("Hello")
    // let d: ?String = None

    let score = 90
    let level = match (score) {
        case 0 | 10 | 20 | 30 | 40 | 50 => "D"
        case 60 => "C"
        case 70 | 80 => "B"
        case 90 | 100 => "A" // Matched.
        case _ => "Not a valid score"
    }
    println(level)

    println(translate(r"三"))

    println(translate_(51)) // UInt32(r'3') == 51    3

    let tv = ("Alice", 24)
    let s = match (tv) {
        case ("Bob", age) => "Bob is ${age} years old"
        case ("Alice", age) => "Alice is ${age} years old" // Matched, "Alice" is a constant pattern, and 'age' is a variable pattern.
        case (name, 100) => "${name} is 100 years old"
        case (_, _) => "someone"
    }
    println(s)

    var der = Derived()
    var rm = match (der) {
        case b: Base => b.a // Matched.
        case _ => 0
    }
    println("r = ${rm}")

    var base = Base()
    var rat = match (base) {
        case d: Derived => d.a // Type pattern match failed.
        case _ => 0 // Matched.
    }
    println("r = ${rat}")

    let xe = Year(2)
    let sea = match (xe) {
        case Year(n) => "x has ${n * 12} months" // Matched.
        case Year(0) | Year(1) | Month(_) => "Ok" // Ok
        case TimeUnit.Month(n) => "x has ${n} months"
    }
    println(sea)


    let command = SetTimeUnit(Year(2024))
    match (command) {
        case SetTimeUnit(Year(year)) => println("Set year ${year}")
        case SetTimeUnit(Month(month)) => println("Set month ${month}")
        case _ => ()
    }

    let xxx = 0
    match (xxx) {
        case 1 => let r1 = "x = 1"
            println(r1)
        case 0 => let r2 = "x = 0" // Matched.
            println(r2)
        case _ => let r3 = "x != 1 and x != 0"
            println(r3)
    }

    let c_ = RGBColor_.Green_(-100)
    let cs = match(c_) {
        case Red_(r) where r < 0 => "Red = 0"
        case Red_(r) => "Red = ${r}"
        case Green_(g) where g < 0 => "Green = 0" // Matched.
        case Green_(g) => "Green = ${g}"
        case Blue_(b) where b < 0 => "Blue = 0"
        case Blue_(b) => "Blue = ${b}"
    }
    println(cs)

    let xxxxx = -1
    match {
        case xxxxx > 0 => println("xxxxx > 0")
        case xxxxx < 0 => println("xxxxx < 0") // Matched.
        case _ => println("xxxxx = 0")
    }

    let xx_ = 2
    let ss_: String = match (xx_) {
        case 0 => "xx_ = 0"
        case 1 => "xx_ = 1"
        case _ => "xx_ != 0 and xx_ != 1" // Matched.
    }
    println(ss_)

    let result_ = Option<Int64>.None // Option<Int64>.Some(2024)
    if (let Some(value) <- result_) {
        println("操作成功，返回值为：${value}")
    } else {
        println("操作失败")
    }

    // 模拟循环接收通信数据，如果失败就结束循环
    while (let Some(data) <- recv()) {
        println(data)
    }
    println("receive failed")

    let (xxx_, yyy_) = (100, 200)
    println("xxx_ = ${xxx_}")
    println("yyy_ = ${yyy_}")
    for ((i, j) in [(1, 2), (3, 4), (5, 6)]) {
        println("Sum = ${i + j}")
    }
    
    let _Red(red) = _Red(0)
    println("red = ${red}")
    for (_Red(r) in [_Red(10), _Red(20), _Red(30)]) {
        println("r = ${r}")
    }

    let aaaaa: AAAA = AAAA()
    let bbbbb: AAAA = BBBB()
    aaaaa.f()
    bbbbb.f()
// 对于被覆盖的函数，调用时将根据变量的运行时类型（由实际赋给该变量的对象决定）确定调用的版本（即所谓的动态派发）。
// 例如，上例中 a 的运行时类型是 A，因此 a.f() 调用的是父类 A 中的函数 f；b 的运行时类型是 B（编译时类型是 A）
// ，因此 b.f() 调用的是子类 B 中的函数 f。所以程序会输出：
// I am superclass
// I am subclass


   let foo = Foo()
   let bar: III = foo
   bar.f() 

   let bird = Bird()
   let bat = Bat()
   let airplane = Airplane()
   fly(bird)
   fly(bat)
   fly(airplane)

   println("the type is ${ AAAAAA.typename() }")
   println("the type is ${ BBBBBB.typename() }")


   println(NamedType.typename())
   println(CCCCCC.typename())


   printTypeName<AAAAAA>()
   printTypeName<BBBBBB>()
//    printTypeName<IIIIII>() // Error, 'I' must implement all static function. Otherwise, an unimplemented 'f' is called, causing problems.
   

   let myInt = MyInt_()
   let add: Addable = myInt
   let sub: Subtractable = myInt
   let calc: Calculable = myInt


    // let a = ArrayList<String>() // Created an empty ArrayList whose element type is String
    // let b = ArrayList<String>(100) // Created an ArrayList whose element type is String, and allocate a space of 100
    // let c = ArrayList<Int64>([0, 1, 2]) // Created an ArrayList whose element type is Int64, containing elements 0, 1, 2
    // let d = ArrayList<Int64>(c) // Use another Collection to initialize an ArrayList
    // let e = ArrayList<String>(2, {x: Int64 => x.toString()}) // Created an ArrayList whose element type is String and size is 2. All elements are initialized by specified rule function

    let lista = ArrayList<Int64>([0, 1, 2])
    for (i in lista) {
        println("The element is ${i}")
    }
    lista.append(0) // list contains element 0
    lista.append(1) // list contains elements 0, 1
    let li = [2, 3]
    lista.appendAll(li) // list contains elements 0, 1, 2, 3
    lista.insert(3, 4) // list contains elements 0, 4, 1, 2
    for (i in lista) {
        println("The element is ${i}")
    }
    lista.remove(3) // Delete the element at subscript 1, now the list contains elements "a", "c", "d"
    for (i in lista) {
        println("The element is ${i}")
    }
    if (lista.size == 0) {
        println("This is an empty arraylist")
    } else {
        println("The size of arraylist is ${lista.size}")
    }
    var it = lista.iterator()
    while (true) {
        match (it.next()) {
            case Some(i) => println(i)
            case None => break
        }
    }

    it = lista.iterator()
    while (let Some(i) <- it.next()) {
        println(i)
    }

    let mySet = HashSet<Int64>([0, 1, 2])
    for (i in mySet) {
        println("The element is ${i}")
    }
    if (mySet.size == 0) {
        println("This is an empty hashset")
    } else {
        println("The size of hashset is ${mySet.size}")
    }

    let aaaa = mySet.contains(0) // a == true
    let bbbb = mySet.contains(-1) // b == false
    println("aaaa = ${aaaa}")
    println("bbbb = ${bbbb}")
    mySet.put(0) // mySet contains elements 0
    mySet.put(0) // mySet contains elements 0
    mySet.put(1) // mySet contains elements 0, 1
    let li2 = [2, 3]
    mySet.putAll(li2) // mySet contains elements 0, 1, 2, 3
    mySet.remove(1) // mySet contains elements 0, 2, 3
    let set2 = mySet
    set2.put(3)
    for (i in mySet) {
        println("The element is ${i}")
    }
    if (mySet.size == 0) {
        println("This is an empty hashset")
    } else {
        println("The size of hashset is ${mySet.size}")
    }
    for (i in set2) {
        println("The element is ${i}")
    }
    if (set2.size == 0) {
        println("This is an empty hashset")
    } else {
        println("The size of set2 is ${set2.size}")
    }

    let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    map.put("a", 0) // map contains the element ("a", 0)
    map.put("b", 1) // map contains the elements ("a", 0), ("b", 1)
    let map2 = HashMap<String, Int64>([("c", 2), ("d", 3)])
    map.putAll(map2) // map contains the elements ("a", 0), ("b", 1), ("c", 2), ("d", 3)
    
    map["e"] = 4 // map contains the elements ("a", 0), ("b", 1), ("c", 2), ("d", 3)
    map.remove("e") // map contains the elements ("a", 0), ("b", 1), ("c", 2)
    for ((k, v) in map) {
        println("The key is ${k}, the value is ${v}")
    }



    // {
        let mtx: ReentrantMutex = ReentrantMutex()
        var future1: Future<Unit> = spawn {
            mtx.lock()
            while (true) {}
            mtx.unlock()
        }
        let res1: Option<Unit> = future1.get(10*1000*1000)
        match (res1) {
            case Some(v) => ()
            case None =>
                if (mtx.tryLock()) {
                    return 1
                }
                return 0
        }
        return 2
    // }


    

/*
var obj: AtomicInt32 = AtomicInt32(1)
var x = obj.load() // x: 1, the type is Int32
x = obj.swap(2) // x: 1
x = obj.load() // x: 2
var y = obj.compareAndSwap(2, 3) // y: true, the type is Bool.
y = obj.compareAndSwap(2, 3) // y: false, the value in obj is no longer 2 but 3. Therefore, the CAS operation fails.
x = obj.fetchAdd(1) // x: 3
x = obj.load() // x: 4
*/
    var obj = AtomicBool(true)
    var x1 = obj.load() // x1: true, the type is Bool
    println(x1)
    var t1 = A()
    var obj2 = AtomicReference(t1)
    var x2 = obj2.load() // x2 and t1 are the same object
    var y1 = obj2.compareAndSwap(x2, t1) // x2 and t1 are the same object, y1: true
    println(y1)
    var t2 = A()
    var y2 = obj2.compareAndSwap(t2, A()) // x and t1 are not the same object, CAS fails, y2: false
    println(y2)
    y2 = obj2.compareAndSwap(t1, A()) // CAS successes, y2: true
    println(y2)

    // spawn {
    //     startServer()
    // }
    // sleep(Duration.second)
    // startClient()


    // spawn {
    //     runTcpServer()
    // }
    // sleep(Duration.millisecond * 500)

    // try (socket = TcpSocket("127.0.0.1", SERVER_PORT)) {
    //     socket.connect()
    //     socket.write(Array<Byte>([1, 2, 3]))
    // }

/*
    let future = spawn {
        runUpdServer()
    }
    sleep(Duration.second)

    try (udpSocket = UdpSocket(bindAt: 0)) {
        udpSocket.sendTimeout = Duration.second * 2
        udpSocket.bind()
        udpSocket.sendTo(
            SocketAddress("127.0.0.1", SERVER_PORT),
            Array<Byte>([1, 2, 3])
        )
    }

    future.get()
*/

/*
// 1 启动服务器
    spawn { startServer() }
    sleep(Duration.millisecond * 200)

    let client = ClientBuilder().build()
    let u = URL.parse("ws://127.0.0.1:${server.port}/webSocket")

    let subProtocol = ArrayList<String>(["foo1", "bar1"])
    let headers = HttpHeaders()
    headers.add("test", "echo")

    // 2 完成 WebSocket 握手，获取 WebSocket 实例
    let websocket: WebSocket
    let respHeaders: HttpHeaders
    (websocket, respHeaders) = WebSocket.upgradeFromClient(client, u, subProtocols: subProtocol, headers: headers)
    client.close()


    println("subProtocol: ${websocket.subProtocol}")      // fool1
    println(respHeaders.getFirst("rsp") ?? "") // echo

    // 3 消息收发
    // 发送 hello
    websocket.write(TextWebFrame, "hello".toArray())
    // 收
    let data = ArrayList<UInt8>()
    var frame = websocket.read()
    while(true) {
        match(frame.frameType) {
            case ContinuationWebFrame =>
                data.appendAll(frame.payload)
                if (frame.fin) {
                    break
                }
            case TextWebFrame | BinaryWebFrame =>
                if (!data.isEmpty()) {
                    throw Exception("invalid frame")
                }
                data.appendAll(frame.payload)
                if (frame.fin) {
                    break
                }
            case CloseWebFrame =>
                websocket.write(CloseWebFrame, frame.payload)
                break
            case PingWebFrame =>
                websocket.writePongFrame(frame.payload)
            case _ => ()
        }
        frame = websocket.read()
    }
    println("data size: ${data.size}")      // 4097
    println("last item: ${String.fromUtf8(Array(data)[4096])}")        // a


    // 4 关闭 websocket，
    // 收发 CloseFrame
    websocket.writeCloseFrame(status: 1000)
    let websocketFrame = websocket.read()
    println("close frame type: ${websocketFrame.frameType}")      // CloseWebFrame
    println("close frame payload: ${websocketFrame.payload}")     // 3, 232
    // 关闭底层连接
    websocket.closeConn()

    server.close()

*/
    
    

    return 0
}

enum RGBColor {
    | Red | Green | Blue(UInt8)

    public static func printType() {
        print("RGBColor")
    }
}

func getOrThrow(a: ?Int64) {
    match (a) {
        case Some(v) => v
        case None => throw NoneValueException()
    }
}

func getString(p: ?Int64): String {
    match (p) {
        case Some(x) => "${x}"
        case None => "none"
    }
}

struct RR {
    public var a: Int64
    public init(a: Int64) {
        this.a = a
    }
}



open class FatherException <: Exception {
    public open func printException() {
        print("I am a FatherException")
    }
}

class ChildException <: FatherException {
    public override func printException() {
        print("I am a ChildException")
    }
}

class BoundedQueue {
    // Create a MultiConditionMonitor, two Conditions.
    let m: MultiConditionMonitor = MultiConditionMonitor()
    var notFull: ConditionID
    var notEmpty: ConditionID

    var count: Int64 // Object count in buffer.
    var head: Int64  // Write index.
    var tail: Int64  // Read index.

    // Queue's length is 100.
    let items: Array<Object> = Array<Object>(100, {i => Object()})

    init() {
        count = 0
        head = 0
        tail = 0

        synchronized(m) {
          notFull  = m.newCondition()
          notEmpty = m.newCondition()
        }
    }

    // Insert an object, if the queue is full, block the current thread.
    public func put(x: Object) {
        // Acquire the mutex.
        synchronized(m) {
          while (count == 100) {
            // If the queue is full, wait for the "queue notFull" event.
            m.wait(notFull)
          }
          items[head] = x
          head++
          if (head == 100) {
            head = 0
          }
          count++

          // An object has been inserted and the current queue is no longer
          // empty, so wake up the thread previously blocked on get()
          // because the queue was empty.
          m.notify(notEmpty)
        } // Release the mutex.
    }

    // Pop an object, if the queue is empty, block the current thread.
    public func get(): Object {
        // Acquire the mutex.
        synchronized(m) {
          while (count == 0) {
            // If the queue is empty, wait for the "queue notEmpty" event.
            m.wait(notEmpty)
          }
          let x: Object = items[tail]
          tail++
          if (tail == 100) {
            tail = 0
          }
          count--

          // An object has been popped and the current queue is no longer
          // full, so wake up the thread previously blocked on put()
          // because the queue was full.
          m.notify(notFull)

          return x
        } // Release the mutex.
    }

}

func f(a1: (Int64) -> Int64): Int64 {
    a1(1)
}

func returnAdd(): (Int64, Int64) -> Int64 {
    add
}

func printAdd(add: (Int64, Int64) -> Int64, a: Int64, b: Int64): Unit {
    println(add(a, b))
}

func returnTuple(a: Int64, b: Int64): (Int64, Int64) {
    (a, b)
}

func foo() {
    func nestAdd(a: Int64, b: Int64) {
        a + b + 3
    }

    println(nestAdd(1, 2))

    return nestAdd
}

/*
func startServer(): Unit {
    // 1.构建 Server 实例
    let server = ServerBuilder()
                       .addr("127.0.0.1")
                       .port(8080)
                       .build()
    // 2. 注册请求处理逻辑
    server.distributor.register("/hello", {httpContext =>
        httpContext.responseBuilder.body("Hello Cangjie!")
    })
    // 3.启动服务
    server.serve()

}

func startClient(): Unit {
    // 1. 构建 client 实例
    let client = ClientBuilder().build()
    // 2. 发送 request
    let resp = client.get("http://127.0.0.1:8080/hello")
    // 3. 读取response
    println(resp)
    // 4. 关闭连接
    client.close()
}
*/

/*
// WebSocket
func startServer() {
    // 1 注册 handler
    server.distributor.register("/WebSocket", handler1)
    server.logger.level = OFF
    server.serve()
}

// server:
func handler1(ctx: HttpContext): Unit {
    // 2 完成websocket握手，获取websocket实例
    // 2 完成 websocket 握手，获取 websocket 实例
    let websocketServer = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["foo", "bar", "foo1"]),
        userFunc: {request: HttpRequest =>
            let value = request.headers.getFirst("test") ?? ""
            let headers = HttpHeaders()
            headers.add("rsp", value)
            headers
        })
    // 3 消息收发
    // 收 hello
    let data = ArrayList<UInt8>()
    var frame = webSocketServer.read()
    while (true) {
      match(frame.frameType) {
        case ContinuationWebFrame =>
            data.appendAll(frame.payload)
            if (frame.fin) {
               break
            }
        case TextWebFrame | BinaryWebFrame =>
            if (!data.isEmpty()) {
                throw Exception("invalid frame")
            }
            data.appendAll(frame.payload)
            if (frame.fin) {
                break
            }
        case CloseWebFrame =>
            websocketServer.write(CloseWebFrame, frame.payload)
            break
        case PingWebFrame =>
            websocketServer.writePongFrame(frame.payload)
        case _ => ()
      }
      frame = webSocketServer.read()
    }
    println("data:${String.fromUtf8(Array(data))}") // hello
    // 发 4097 个 a
    webSocketServer.write(TextWebFrame, Array<UInt8>(4097, item: 97))

    // 4 关闭 websocket
    // 收发 CloseFrame
    let websocketFrame = webSocketServer.read()
    println("close frame type: ${websocketFrame.frameType}")   // CloseWebFrame
    println("close frame payload: ${websocketFrame.payload}")     // 3, 232
    websocketServer.write(CloseWebFrame, websocketFrame.payload)
    // 关闭底层连接
    websocketServer.closeConn()
}
*/



// TCP/UDP
func runTcpServer() {
    try (serverSocket = TcpServerSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()

        try (client = serverSocket.accept()) {
            let buf = Array<Byte>(10, item: 0)
            let count = client.read(buf)

            // 服务端读取到的数据为: [1, 2, 3, 0, 0, 0, 0, 0, 0, 0]
            println("Server read ${count} bytes: ${buf}")
        }
    }
}

func runUpdServer() {
    try (serverSocket = UdpSocket(bindAt: SERVER_PORT)) {
        serverSocket.bind()

        let buf = Array<Byte>(3, item: 0)
        let (clientAddr, count) = serverSocket.receiveFrom(buf)
        let sender = clientAddr.hostAddress

        // 套接字收取到的报文以及远端地址: [1, 2, 3]， 127.0.0.1
        println("Server receive ${count} bytes: ${buf} from ${sender}")
    }
}