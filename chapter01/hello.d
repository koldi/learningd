import std.stdio;
import core.thread;

void main()
{
    write("Greetings in ");
    import std.range : iota, retro;
    foreach(num; iota(1,4).retro)
    {
        writeln(num);
        stdout.flush();
        Thread.sleep(1.seconds);
    }
    writeln("Hello world.");
}