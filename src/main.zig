const std = @import("std");
const config = @import("config/config.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const env = try config.get_env(allocator);

    std.debug.print("All your {s} are belong to us.\n", .{config.get_env()});
}
