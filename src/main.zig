const std = @import("std");

pub fn main() void {
    //Zigling 1 : Hello world
    std.debug.print("Hello world!\n", .{});

    // Zigling 2 : Datatypes
    var n: u8 = 50;
    n += 5;
    const pi: u32 = 314159;
    const neg: i8 = -11;

    std.debug.print("{} {} {}\n", .{ n, pi, neg });

    //Zigling 3 : Arrays
    var primes = [_]u8{ 1, 3, 5, 7, 11, 12, 17, 19 };
    primes[0] = 2;
    const first = primes[0];
    const fourth = primes[3];
    const length = primes.len;
    std.debug.print("First ele: {}, Fourth ele: {}, Length of the array: {}\n", .{ first, fourth, length });

    //Zigling 4 : Array concatenation ++ & Repeat ** , For loops
    const a = [_]u8{ 1, 2, 3 };
    const b = [_]u8{ 4, 5, 6 };
    const ab = a ++ b;

    const onezerozeroonethrice = [_]u8{ 1, 0, 0, 1 } ** 3;

    for (ab) |i| {
        std.debug.print("{} ", .{i});
    }

    std.debug.print("\n", .{});

    for (onezerozeroonethrice) |i| {
        std.debug.print("{} ", .{i});
    }
    std.debug.print("\n", .{});

    //Zigling 5: Strings
    const ziggy = "stardust";
    const d: u8 = ziggy[4];
    const laugh = "ha " ** 3;
    const pp = "asdfa";
    const qq = "asdjfka";
    const pp_qq = pp ++ " " ++ qq;

    std.debug.print("d={u} {s}{s}\n", .{ d, laugh, pp_qq });

    //Zigling 6: Multi-line Strings
    const lyrics =
        \\Ziggy played guitar
        \\Jamming good with Andrew Kelley
        \\And the Spiders from Mars
    ;
    std.debug.print("{s}\n", .{lyrics});

    //Zigling 7: Quiz
    const letters = "YZhifg";

    // Note: usize is an unsigned integer type used for...sizes.
    // The exact size of usize depends on the target CPU
    // architecture. We could have used a u8 here, but usize is
    // the idiomatic type to use for array indexing.
    var x: usize = 1;

    // Note: When you want to declare memory (an array in this
    // case) without putting anything in it, you can set it to
    // 'undefined'. There is no problem on this line.
    var lang: [3]u8 = undefined;

    lang[0] = letters[x];

    x = 3;
    lang[1] = letters[x];

    x = 5;
    lang[2] = letters[x];

    std.debug.print("Program in {s}!\n", .{lang});

    //Zigling 8: If statements
    const foo = true;

    if (foo) {
        std.debug.print("Foo is 1!\n", .{});
    } else {
        std.debug.print("Foo is not 1!\n", .{});
    }

    //Zigling 9: Ternary If
    const discount = true;
    const price: u8 = if (discount) 17 else 20;
    std.debug.print("With the discount, the price is ${}.\n", .{price});

    //Zigling 10: While loop
    var y: u32 = 2;
    while (y < 1024) {
        std.debug.print("{} ", .{y});
        y *= 2;
    }

    std.debug.print("y={}\n", .{y});

    //Zigling 11: While loop with continue expression
    var p: u32 = 2;
    while (p < 1000) : (p *= 2) {
        std.debug.print("{} ", .{p});
    }
    std.debug.print("p={}\n", .{p});

    //Zigling 12: While loop with continue expression and continue statement

    p = 2;
    while (p < 1000) : (p *= 2) {
        if (p == 512 or p == 256) continue;
        std.debug.print("{} ", .{p});
    }
    std.debug.print("p={}\n", .{p});

    //Zigling 13: While loop with continue expression and break statement

    p = 2;
    while (p < 1000) : (p *= 2) {
        if (p == 256) break;
        std.debug.print("{} ", .{p});
    }
    std.debug.print("p={}\n", .{p});

    //Zigling 14: For loop - basic variant

    const story = [_]u8{ 'h', 'h', 's', 'n', 'h' };

    std.debug.print("A Dramatic Story: ", .{});

    for (story) |scene| {
        if (scene == 'h') std.debug.print(":-)  ", .{});
        if (scene == 's') std.debug.print(":-(  ", .{});
        if (scene == 'n') std.debug.print(":-|  ", .{});
    }

    std.debug.print("The End.\n", .{});

    //Zigling 15: For loop - advanced variant

    const bits = [_]u8{ 1, 0, 1, 1 };
    var value: u32 = 0;

    for (bits, 0..) |bit, i| {
        // Note that we convert the usize i to a u32 with
        // @intCast(), a builtin function just like @import().
        const i_u32: u32 = @intCast(i);
        const place_value = std.math.pow(u32, 2, i_u32);
        value += place_value * bit;
    }

    std.debug.print("The value of bits '1101': {}.\n", .{value});

    //Zigling 16: Quiz 2 - Fizzbuzz

    var i: u8 = 1;
    while (i <= 30) : (i += 1) {
        if (i % 3 == 0) std.debug.print("Fizz", .{});
        if (i % 5 == 0) std.debug.print("Buzz", .{});
        if (i % 3 != 0 and i % 5 != 0) std.debug.print("{}", .{i});
        if (i < 30) std.debug.print(", ", .{});
        if (i == 30) std.debug.print("\n", .{});
    }
}
