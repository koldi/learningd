module protection2;
import std.stdio;

class MyClass {
    private void sayHello() {
        writeln("Hello");
    }
}

struct MyStruct {
    void sayHello() {
        MyClass mc = new MyClass;
        mc.sayHello();
    }
}