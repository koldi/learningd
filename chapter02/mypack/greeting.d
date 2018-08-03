module mypack.greeting;
// public import for stdio. every moule which imports this modeule can use stdio as well
public import std.stdio;
/*
public {
    import std.stdio;
}
public:
    import std.stdio;
*/
void sayHello() {
    writeln("Hello");
}