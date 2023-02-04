const std = @import("std");
const assert = std.debug.assert;
const napi = @import("napi.zig");
const translate = @import("translate.zig");

export fn napi_register_module_v1(env: napi.napi_env, exports: napi.napi_value) napi.napi_value {
    translate.register_function(env, exports, "greet", greet) catch return null;
    translate.register_function(env, exports, "getArrayElement", getArrayElement) catch return null;
    return exports;
}

fn greet(env: napi.napi_env, info: napi.napi_callback_info) callconv(.C) napi.napi_value {
    _ = info;
    return translate.create_string(env, "world") catch return null;
}

fn getArrayElement(env: napi.napi_env, info: napi.napi_callback_info) callconv(.C) napi.napi_value {
    return translate.getArrayElement(env, info) catch return null;
}
