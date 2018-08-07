import std.stdio;

void main() {    
    // string types
    string s = "soufflé";
    wstring ws = "soufflé"w;
    dstring ds = "soufflé"d;
    // multi line string
    auto s1 = " Hi 
    I
     am a multi-line
        string";
    writeln(s1);
    auto s2 = "I am" ~ " a string which is"
    ~ " composed of multiple strings"
    ~ " on multiple lines.";
    writeln(s2);
    // conversation
    import std.conv : to, parse;
    int x = 10;
    auto sint = to!string(x);
    writeln(sint);
    string stoint1 = "10";
    string stoint2 = "10and20";
    int x1 = to!int(stoint1);
    writeln(x1);
    //int x2 = to!int(stoint2); // throw exception
    int x3 = parse!int(stoint2);
    writeln(x3);
    // delimiter strings
    writeln(r"I'm a WYSIWYG string '```'\t\n");
    writeln(`me, too!\n\r"'''""`);
    writeln(q"(A Delimited String (with nested parens))");
    // token strings
    auto code = q{
        int x = 10;
        int y = 1;
    };
    writeln(code);
    // who knows what else
    immutable int y = 10;
    immutable(int*) py = &y;
    writeln(py);
    int** ppy = cast(int**)&py;
    int j = 9;
    *ppy = &j;
    writeln(py);
    // undefined behaviour
    immutable int ix = 10;
    int* px = cast(int*)&ix;
    *px = 9;
    writeln(ix);
}