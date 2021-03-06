# Copyright (c) 2001, Stanford University
# All rights reserved.
#
# See the file LICENSE.txt for information on redistributing this software.

from __future__ import print_function
import sys

import apiutil


keys = apiutil.GetDispatchedFunctions(sys.argv[1]+"/APIspec.txt")


apiutil.CopyrightC()

print("""
/* DO NOT EDIT - THIS FILE AUTOMATICALLY GENERATED BY pack.py SCRIPT */
#include <stdio.h>
#include "cr_string.h"
#include "cr_spu.h"
#include "packspu.h"
#include "cr_packfunctions.h"
#include "packspu_proto.h"
""")

num_funcs = len(keys) - len(apiutil.AllSpecials('packspu_unimplemented'))
print('SPUNamedFunctionTable _cr_pack_table[%d];' % (num_funcs+1))

print("""
static void __fillin(int offset, char *name, SPUGenericFunction func)
{
    _cr_pack_table[offset].name = crStrdup(name);
    _cr_pack_table[offset].fn = func;
}""")

pack_specials = []

for func_name in keys:
    if ("get" in apiutil.Properties(func_name) or
        apiutil.FindSpecial( "packspu", func_name ) or 
        apiutil.FindSpecial( "packspu_flush", func_name ) or 
        apiutil.FindSpecial( "packspu_vertex", func_name )):
      pack_specials.append( func_name )

print('\nvoid packspuCreateFunctions( void )')
print('{')
for index in range(len(keys)):
    func_name = keys[index]
    if apiutil.FindSpecial( "packspu_unimplemented", func_name ):
        continue
    if func_name in pack_specials:
        print('\t__fillin(%3d, "%s", (SPUGenericFunction) packspu_%s);' % (index, func_name, func_name ))
    else:
        print('\t__fillin(%3d, "%s", (SPUGenericFunction) (pack_spu.swap ? crPack%sSWAP : crPack%s));' % (index, func_name, func_name, func_name ))
print('\t__fillin(%3d, NULL, NULL);' % num_funcs)
print('}')
