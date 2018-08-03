static import mypack.greeting;

// named imports: import greet = mypack.greeting;

void main() {
    mypack.greeting.sayHello();
    // needs FQN for srdio as well because of static import
    mypack.greeting.writeln("Public import enabled.");
}