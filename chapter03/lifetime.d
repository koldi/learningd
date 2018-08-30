module lifetime;
import std.stdio;

// constructor
class TwoCon {
    private int _x;
    this() { this(10); }
    this(int x) { _x = x; }
}

//destructor
class Decon {
    this() { writeln("Constructed."); }
    // no guarantee that class destructor will ever be executed
    // class destructors are nondeterministic
    ~this() { writeln("Destroyed"); }
    void print() { writeln("printing"); }
}

void printDecon() {
    auto d = new Decon;
    d.print();
}

class Innocent {
    void bye() { writeln("bye"); }
}

class Boom {
    Innocent _inno;
    this() { _inno = new Innocent; }
    // this could be caused a segfault
    ~this() { _inno.bye(); }
}

struct MyStruct {
    int x,y;
    // no default contructor, never.
    // default means, init with .init
}

struct Disabled {
    int x,y;

    this(int a) { x = y = a; }
    @disable this();
}

// postblit constructor for struct
struct PostBlit {
    int[] foo;
    // fix for create a copy for foo
    this(this) { foo = foo.dup; }
}

struct Destuct {
    ~this() { writeln("Destructed"); }
}
void doSomething() {
    writeln("Init a destruct");
    Destuct d;
    writeln("leaving the function");
}

// copy made, its a bitwise copy
// only the metadata is copied for foo, not the elements
void printPtr(PostBlit cpb) {
    writeln("Inside: ", cpb.foo.ptr);
}

void main() {
    printDecon();

    auto b = new Boom;

    // init struct
    auto ms1 = MyStruct(10, 11); // struct literal
    MyStruct ms2 = {10,11}; // c style, not predered
    MyStruct ms3 = { x:10, y:20 }; // named init

    // postblit
    auto pb = PostBlit([10, 20, 30]);
    writeln("Outside: ", pb.foo.ptr);
    printPtr(pb);

    doSomething();
    writeln("leaving main");
}
static ~this() {
    writeln("modeule destructor");
}