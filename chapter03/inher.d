module inher;
import std.stdio;

class Simpleton {}

class Babbler {
    protected string genMessage() {
        return "asdsadjlfasdfja;s";
    }
    // from object
    override string toString() {
        import std.format : format;
        return format("%s says %s", super.toString(), genMessage());
        return "aosdijasldfalsjn";
    }
}

class Elocutioner : Babbler {
    protected override string genMessage() {
        return super.genMessage() ~ "hatpersze";
    }
}

// fake inheritence
struct PrintOps {
    void print(double arg) {
        writeln(arg);
    }
}

struct MathOps {
    PrintOps printer;
    alias printer this;
    double add(double a, double b) {
        return a + b;
    }
}

void main() {
    writeln(new Simpleton);
    writeln(new Babbler);
    writeln(new Elocutioner);

    MathOps ops;
    auto val = ops.add(1.0, 2.0);
    ops.print(val);
}