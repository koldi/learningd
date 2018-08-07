import std.stdio;

// normal function
uint packRGBA(ubyte r, ubyte g, ubyte b, ubyte a = 255) {
    return (r << 24) + (g << 16) + (b << 8) + a;
}

// inner functions
void manyFuncs() {
    int innerNumber1() {
        writeln("Number1");
        return 1;
    }
    {
        void innerNumber2() {
            writeln("Number2");
        }
        innerNumber2();
    }
    for(int i = 0; i < 10; i++) {
        void innerNumber3() {
            writeln(i);
        }
        innerNumber3();
    }
    innerNumber1();
}

// UFCS
auto inc(int x) { return ++x; }

// overloaded functions
void print(int i) { writeln(i); }
void print(string s) { writeln(s); }

// ref and out
void swap(ref int x, ref int y) {
    auto tmp = x;
    x = y;
    y = tmp;
}

// inout parameters
inout(int)[] writeAndReturn(inout(int)[] arr) {
    writeln(arr);
    return arr;
}

// lazy parameters
void normalParam(int x) {
    writeln("Entered normalParam");
    writeln(x);
}
void lazyParam(lazy int x) {
    writeln("Entered lazyParam");
    writeln(x);
}
int getInt() {
    writeln("Entered getInt");
    return 10;
}

// function pointer
void myFunc(int x) { writeln(x); }

// delegate
void proxy(void delegate() dg) {
    dg();
}

// shorter lambdas
void performTest(int a, int b, bool function(int, int) test) {
    writeln("The result is ", test(a,b));
}

void main() {
    auto white = packRGBA(255, 255, 255);
    auto transWhite = packRGBA(255, 255, 255, 127);
    manyFuncs();
    manyFuncs;

    auto n1 = 2.inc();
    auto n2 = n1.inc;
    auto n3 = 2.inc.inc.inc.inc.inc;
    writeln(n3);

    int x = 10;
    int y = 20;
    swap(x,y);
    writeln(x, ", ", y);
    x.swap(y);
    writeln(x, ", ", y);

    // inout - all type of parameters match - const ot not const
    immutable(int)[] ia = [10,20,30];
    int[] a = [1,2,3];
    writeln(typeid(writeAndReturn(ia)));
    writeln(typeid(writeAndReturn(a)));

    // lazy
    normalParam(getInt());
    lazyParam(getInt());

    // funtion pointer
    void function(int) funcPtr = &myFunc;
    alias MyFuncPtr = void function(int);
    funcPtr(22);

    // delegate
    void myDel() {
        writeln(x);
    }
    proxy(&myDel);

    // from literals
    auto fp1 = function int(int i) { return i * 2; };
    auto d1 = delegate void { writeln(fp1(10)); };
    // with lambdas
    auto fp2 = function (int i) => i + 1;
    auto d2 = delegate () => "Hello";
    // shorter lambdas
    performTest(1,2, (a,b) {return a == b;});
    performTest(1,2, (a,b) => a < b );
}