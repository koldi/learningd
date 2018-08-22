import std.stdio;

// enum - int
enum { top, bottom, left, right }
// enum - ubyte
enum : ubyte {red, green, blue, alpha}
// type is immutable char[] 
enum { one = "One", two = "Two" }
// manifest constant
enum {author = "Mike Parker"}
enum author2 = "Mike Parker";
enum string author3 = "Mike Parker";
// named enums creates new type
enum Side {top, bottom, left, right}
enum Color : ubyte {red, green, blue, alpha}


void main() {
    writeln(Side.init);
    writeln(Side.min);
    writeln(Side.max);
    writeln(Side.sizeof);

    // compiler error if one of the enums is missing
    auto s = Side.bottom;
    final switch(s) {
        case Side.top: 
            writeln("On top");
            break;
        case Side.bottom: 
            writeln("On bottom");
            break;
        case Side.left: 
            writeln("On left");
            break;
        case Side.right: 
            writeln("On right");
            break;
    }

    // Unions - c compatibility
    // std.variant is better

    // size of double
    union One {
        int a = 10;
        double b;
    }

    writeln(One.sizeof);
}