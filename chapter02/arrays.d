import std.stdio;

void main() {
    // static array
    int[3] arr1;
    writeln(arr1);

    // dynamic arrays
    int[] dynarr1;
    writeln(dynarr1);
    dynarr1 = new int[3];
    writeln(dynarr1);
    //prefered syntax for dyn array declaration
    auto dynarr2 = new int[](3);
    auto dynarr3 = new int[](10);
    writeln(dynarr2);
    writeln(dynarr2.capacity);
    writeln(dynarr3.capacity);

    int[] dynarr4;
    dynarr4.reserve(20);
    writefln("%s, %s", dynarr4.length, dynarr4.capacity);
    // append operator and concatenation operator
    dynarr4 ~= 3;
    dynarr4 ~= 10;
    writeln(dynarr4);
    auto dynarr5 = dynarr4 ~ dynarr1;
    writeln(dynarr5);
    writeln(dynarr5.length);
    writeln(dynarr5.capacity);
    
    // add elements by modifing its length
    dynarr5.length += 10;
    writeln(dynarr5);
    writeln(dynarr5.length);
    writeln(dynarr5.capacity);
    // last element
    writeln(dynarr5[$-1]); 
    // rectangular array
    // _________
    // |_|_|_|_|
    // |_|_|_|_|
    // |_|_|_|_|
    // (int[4])[3] 
    int[4][3] dgrid;
    // with different length
    int[][3] ra2 = [ 
        [0,1],
        [2,3,4,5],
        [6,7,8] 
    ];
    writeln(ra2[0].length);
    writeln(ra2[1].length);
    writeln(ra2[2].length);
    // slices
    auto tenarray = [1,2,3,4,5,6,7,8,9,10];
    auto sliced = tenarray[0..5];
    writeln(sliced);
    writeln(sliced.capacity);
    tenarray[0] = 10;
    writeln(sliced);
    writeln(sliced.ptr);
    writeln(tenarray.ptr);
    // modifing the slice
    sliced ~= 55;
    writefln("Pointers: %s %s", tenarray.ptr, sliced.ptr);
    writefln("Caps: %s %s", tenarray.capacity, sliced.capacity);

    auto shrink = [10, 20, 30, 40, 50];
    shrink = shrink[0 .. $-1];
    writeln(shrink);
    writeln(shrink.capacity);
    assumeSafeAppend(shrink);
    writeln(shrink.capacity);
    // remove
    import std.algorithm : remove;
    shrink = shrink.remove(2);
    writeln(shrink);
    // slice entire array 
    auto aSlice = dynarr5[];
    auto anotherSlice = dynarr5;
    writeln(aSlice);
    writeln(aSlice.capacity);
    writeln(dynarr5.ptr);
    writeln(aSlice.ptr);
    writeln(anotherSlice.ptr);
    // create a copy
    auto copied = dynarr5.dup;
    writeln(copied);
    writeln(copied.capacity);
    writeln(dynarr5.ptr);
    writeln(copied.ptr);
    // uninitialized dyn array
    import std.array : uninitializedArray;
    auto uninitarray = uninitializedArray!(float[])(10);
    writeln(uninitarray);
    // diff between dub and []
    int[] a1 = new int[10];
    writeln(a1.ptr);
    int[] a2 = [0,1,2,3,4,5,6,7,8,9];
    a1[] = a2;
    writeln(a1.ptr);
    a1 = a2.dup;
    writeln(a1.ptr);
    // init with value
    int[10] sa1 = 10;
    sa1[] = 100;
    writeln(sa1);
    // array operators
    int[] a = [2,3,4];
    a[] ^^= 2;
    writeln(a);
    int[] b = [5,6,7];
    int[3] c = a[] + b[];
    writeln(c);
    // equality
    auto ea1 = [1,2,3];
    auto ea2 = [1,2,3];
    writeln(ea1 == ea2);
    writeln(ea1 is ea2);
}