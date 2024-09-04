import UIKit

// Declaración implícita
// variable: var
var greeting = "Hello"

// Declaración explícita
var myName: String
myName = "Jorge"
myName = "Jorge Luis"

// constante: let
let myAge = 39

func sayHi(name: String) {
    print("Hi \(name)")
}

sayHi(name: myName)


func addNumber(_ number1: Int, with number2: Int) -> Int {
    number1 + number2
}

addNumber(10, with: 5)

// Closures

// Básico
let sayHello = {
    print("Hello world")
}

sayHello()

// Como parámetro
func performOperation(a: Int, b: Int, operation:(Int, Int)-> Int ) -> Int{
    return operation(a, b)
}

let multiplication = performOperation(a: 8, b: 3) { p1, p2 in
    p1 * p2
}

print(multiplication)

let sum = performOperation(a: 10, b: 3)  { p1, p2 in
    p1 + p2
}

print(sum)

let random = performOperation(a: 5, b: 10) { _, _ in
    5
}

print(random)

typealias operation = (Int, Int) -> Int

func executeOperation(a: Int, b: Int, completion: operation) -> Int{
    completion(a, b)
}

let minus = executeOperation(a: 10, b: 5) { p1, p2 in
    p1 - p2
}
print(minus)

// Estructuras repititivas

for index in 0...10 {
    print(index)
}

typealias Names = [String]

// Declaración implícita
var names: Names

// Inicializando la variable
names = Names()

// Agregando elementos al arreglo
names.append("Jorge")
names.append("Carlos")
names.append("Ana")

for name in names {
    print(name)
}


func factorial (number: Int) -> Int {
    if (number < 0) {
        print("Debe ingresar un número entero positivo")
        return 0
    }
    
    if (number == 1) {
        return 1
    }
    return factorial(number: number - 1 ) * number
    
}

print (factorial(number: 10))

