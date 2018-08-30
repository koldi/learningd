import std.stdio;

// value type
struct MyStruct {
    int a,b;
    int calculate() { return a + b; }
}

// reference type
class MyClass {
    int a, b;
    int calculate() { return a + b; }
}

void modMS(MyStruct ms1, ref MyStruct ms2, MyStruct* ms3) {
    // modeifies local copy
    ms1.a = 1;
    // modifies original
    ms2.a = 1;
    // modifies original
    ms3.a = 1;
}

void modMC(MyClass mc) {
    // modifies original
    mc.a = 1;
}

void main() {
    MyStruct ms;
    writeln(ms.calculate());

    MyClass mc = new MyClass;
    writeln(mc.calculate());


    MyStruct ms2;
    with(ms2) {
        a = 2;
        writeln(calculate());
    }
}