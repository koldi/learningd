import std.stdio;
import priv;
void main() {
    auto priv = makeAPriv(1,2);
    writeln(priv.x);
    auto priv2 = makeAPriv2(1,2);
    writeln(priv2.x);
}