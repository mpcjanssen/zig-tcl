const tcl = @cImport({
    @cDefine("USE_TCL_STUB","1");
    @cInclude("/usr/include/tcl/tcl.h");
});


const std = @import("std");

export fn Test_Init(interp: *tcl.Tcl_Interp) c_int { 
   std.debug.warn("\nStarting hello {}\n", .{interp});   
   var rc = tcl.Tcl_InitStubs(interp,"8.5", 0);
   std.debug.warn("\nStarting hello {s}\n", .{rc});   
   return tcl.Tcl_PkgProvide(interp,"test", "0.1.0");
}

