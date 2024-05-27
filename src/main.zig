const tcl = @import("tcl.zig");

const std = @import("std");

export fn Test_Init(interp: *tcl.Tcl_Interp) c_int { 

   return tcl.Tcl_PkgProvide(interp,"test", "0.0.1");
}

