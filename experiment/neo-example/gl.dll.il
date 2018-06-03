
//  Microsoft (R) .NET Framework IL Disassembler.  Version 4.6.1055.0
//  Copyright (c) Microsoft Corporation.  All rights reserved.



// Metadata version: v4.0.30319
.assembly extern System.Runtime
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )                         // .?_....:
  .ver 4:2:0:0
}
.assembly extern Neo.SmartContract.Framework
{
  .ver 2:7:3:0
}
.assembly gl
{
  .custom instance void [System.Runtime]System.Runtime.CompilerServices.CompilationRelaxationsAttribute::.ctor(int32) = ( 01 00 08 00 00 00 00 00 ) 
  .custom instance void [System.Runtime]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::.ctor() = ( 01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
                                                                                                                   63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01 )       // ceptionThrows.

  // --- The following custom attribute is added automatically, do not uncomment -------
  //  .custom instance void [System.Runtime]System.Diagnostics.DebuggableAttribute::.ctor(valuetype [System.Runtime]System.Diagnostics.DebuggableAttribute/DebuggingModes) = ( 01 00 02 00 00 00 00 00 ) 

  .custom instance void [System.Runtime]System.Runtime.Versioning.TargetFrameworkAttribute::.ctor(string) = ( 01 00 18 2E 4E 45 54 43 6F 72 65 41 70 70 2C 56   // ....NETCoreApp,V
                                                                                                              65 72 73 69 6F 6E 3D 76 32 2E 30 01 00 54 0E 14   // ersion=v2.0..T..
                                                                                                              46 72 61 6D 65 77 6F 72 6B 44 69 73 70 6C 61 79   // FrameworkDisplay
                                                                                                              4E 61 6D 65 00 )                                  // Name.
  .custom instance void [System.Runtime]System.Reflection.AssemblyCompanyAttribute::.ctor(string) = ( 01 00 02 67 6C 00 00 )                            // ...gl..
  .custom instance void [System.Runtime]System.Reflection.AssemblyConfigurationAttribute::.ctor(string) = ( 01 00 07 52 65 6C 65 61 73 65 00 00 )             // ...Release..
  .custom instance void [System.Runtime]System.Reflection.AssemblyFileVersionAttribute::.ctor(string) = ( 01 00 07 31 2E 30 2E 30 2E 30 00 00 )             // ...1.0.0.0..
  .custom instance void [System.Runtime]System.Reflection.AssemblyInformationalVersionAttribute::.ctor(string) = ( 01 00 05 31 2E 30 2E 30 00 00 )                   // ...1.0.0..
  .custom instance void [System.Runtime]System.Reflection.AssemblyProductAttribute::.ctor(string) = ( 01 00 02 67 6C 00 00 )                            // ...gl..
  .custom instance void [System.Runtime]System.Reflection.AssemblyTitleAttribute::.ctor(string) = ( 01 00 02 67 6C 00 00 )                            // ...gl..
  .hash algorithm 0x00008004
  .ver 1:0:0:0
}
.module gl.dll
// MVID: {E48FC9B6-2590-4F8B-B6B0-D4687B812CA9}
.imagebase 0x00400000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003       // WINDOWS_CUI
.corflags 0x00000001    //  ILONLY
// Image base: 0x00C50000


// =============== CLASS MEMBERS DECLARATION ===================

.class public sequential ansi sealed beforefieldinit Neo.SmartContract.Point
       extends [System.Runtime]System.ValueType
{
  .field public int32 X
  .field public int32 Y
} // end of class Neo.SmartContract.Point

.class public auto ansi beforefieldinit Neo.SmartContract.StructExample
       extends [Neo.SmartContract.Framework]Neo.SmartContract.Framework.SmartContract
{
  .method public hidebysig static valuetype Neo.SmartContract.Point 
          Add(valuetype Neo.SmartContract.Point a,
              valuetype Neo.SmartContract.Point b) cil managed
  {
    // Code size       50 (0x32)
    .maxstack  3
    .locals init (valuetype Neo.SmartContract.Point V_0)
    IL_0000:  ldloca.s   V_0
    IL_0002:  initobj    Neo.SmartContract.Point
    IL_0008:  ldloca.s   V_0
    IL_000a:  ldarg.0
    IL_000b:  ldfld      int32 Neo.SmartContract.Point::X
    IL_0010:  ldarg.1
    IL_0011:  ldfld      int32 Neo.SmartContract.Point::X
    IL_0016:  add
    IL_0017:  stfld      int32 Neo.SmartContract.Point::X
    IL_001c:  ldloca.s   V_0
    IL_001e:  ldarg.0
    IL_001f:  ldfld      int32 Neo.SmartContract.Point::Y
    IL_0024:  ldarg.1
    IL_0025:  ldfld      int32 Neo.SmartContract.Point::Y
    IL_002a:  add
    IL_002b:  stfld      int32 Neo.SmartContract.Point::Y
    IL_0030:  ldloc.0
    IL_0031:  ret
  } // end of method StructExample::Add

  .method public hidebysig static void  Main() cil managed
  {
    .entrypoint
    // Code size       92 (0x5c)
    .maxstack  5
    .locals init (valuetype Neo.SmartContract.Point[] V_0,
             valuetype Neo.SmartContract.Point V_1)
    IL_0000:  ldc.i4.2
    IL_0001:  newarr     Neo.SmartContract.Point
    IL_0006:  dup
    IL_0007:  ldc.i4.0
    IL_0008:  ldloca.s   V_1
    IL_000a:  initobj    Neo.SmartContract.Point
    IL_0010:  ldloca.s   V_1
    IL_0012:  ldc.i4.1
    IL_0013:  stfld      int32 Neo.SmartContract.Point::X
    IL_0018:  ldloca.s   V_1
    IL_001a:  ldc.i4.2
    IL_001b:  stfld      int32 Neo.SmartContract.Point::Y
    IL_0020:  ldloc.1
    IL_0021:  stelem     Neo.SmartContract.Point
    IL_0026:  dup
    IL_0027:  ldc.i4.1
    IL_0028:  ldloca.s   V_1
    IL_002a:  initobj    Neo.SmartContract.Point
    IL_0030:  ldloca.s   V_1
    IL_0032:  ldc.i4.2
    IL_0033:  stfld      int32 Neo.SmartContract.Point::X
    IL_0038:  ldloca.s   V_1
    IL_003a:  ldc.i4.1
    IL_003b:  stfld      int32 Neo.SmartContract.Point::Y
    IL_0040:  ldloc.1
    IL_0041:  stelem     Neo.SmartContract.Point
    IL_0046:  stloc.0
    IL_0047:  ldloc.0
    IL_0048:  ldc.i4.0
    IL_0049:  ldelem     Neo.SmartContract.Point
    IL_004e:  ldloc.0
    IL_004f:  ldc.i4.1
    IL_0050:  ldelem     Neo.SmartContract.Point
    IL_0055:  call       valuetype Neo.SmartContract.Point Neo.SmartContract.StructExample::Add(valuetype Neo.SmartContract.Point,
                                                                                                valuetype Neo.SmartContract.Point)
    IL_005a:  pop
    IL_005b:  ret
  } // end of method StructExample::Main

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // Code size       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [Neo.SmartContract.Framework]Neo.SmartContract.Framework.SmartContract::.ctor()
    IL_0006:  ret
  } // end of method StructExample::.ctor

} // end of class Neo.SmartContract.StructExample


// =============================================================

// *********** DISASSEMBLY COMPLETE ***********************
// WARNING: Created Win32 resource file \\BERRY\data\storage\Dump\neo-example\gl.dll.res
