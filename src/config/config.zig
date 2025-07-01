const std = @import("std");
const dotenv = @import("dotenv");

const EnvKeys = enum { RABBIT_URL, DB_URL, REDIS_URL };

const Env = dotenv.Env(EnvKeys);

pub const EnvVars = struct {
    rabbit_url: []const u8,
    db_url: []const u8,
    redis_url: []const u8,
};

pub fn get_env(allocator: std.mem.Allocator) !EnvVars {
    var env = Env.init(allocator, true);
    defer env.deinit();

    try env.load(.{ .filename = ".env.local", .set_envs_inprocess = true, .silent = true });

    return EnvVars{
        .rabbit_url = env.key(.RABBIT_URL),
        .db_url = env.key(.DB_URL),
        .redis_url = env.key(.REDIS_URL),
    };
}
