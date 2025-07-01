const std = @import("std");
const config = @import("config/config.zig");

pub fn main() !void {
    std.debug.print("All your {s} are belong to us.\n", .{});
}
