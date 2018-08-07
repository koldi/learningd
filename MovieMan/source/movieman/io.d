module moveieman.io;
public import std.stdio;

string readString() {
    import std.string : chomp;
    return readln().chomp;
}

uint readUint() {
    import std.conv : to;
    try {
        return readString().to!uint;
    } 
    catch(Exception e) {
        return 0;
    }
}

string readTitle() {
    writeln("\nEnter a movie title:");
    return readString();
}

uint readNumber(string label) {
    writefln("\nEnter a %s number:", label);
    return readUint();
}

bool readChoise(string msg1, string msg2 = "abort") {
    writefln("\nEnter 1 to %s.", msg1);
    writefln("\nPress enter to %s.", msg2);
    return readUint() == 1;
}

uint readChoise(string[] msgs, string msg2 = "abort") {
    writeln();
    foreach(index, msg; msgs) {
        writefln("Enter %s to %s.", index + 1, msg);
    }
    writefln("\nPress enter to %s.", msg2);
    return readUint();
}

void printList(string header, string[] list) {
    writeln("\n", header);
    foreach(index, line; list) {
        writefln("\t%s. %s", index+1, line);
    }
    writeln();
}