import moveieman.io;

void main()
{
	auto title = readTitle();
	writeln("The title is: ", title);

	auto number = readNumber("page");
	writeln("The number is: ", number);

	auto bchoise = readChoise("Continue", "Abort");
	writeln("You chose to: ", bchoise ? "Continue" : "Abort");

	auto choises = ["Eat pizza", "Sleep", "Watch game of thrones", "Play skyrim"];
	auto uichoise = readChoise(choises, "do nothing");

	if (!uichoise) {
		writeln("You chose to do nothing");
	} else {
		writeln("You chose to ", choises[uichoise - 1]);
	}

	printList("What do you feel like doing?", choises);
	uichoise = readUint();
	writeln("You chose option #", uichoise);

}
