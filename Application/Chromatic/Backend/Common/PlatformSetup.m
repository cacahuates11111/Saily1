//
//  NSObject+PlatformSetup.m
//  Chromatic
//
//  Created by QAQ on 2022/12/9.
//  Copyright © 2022 Lakr Aream. All rights reserved.
//

#import "PlatformSetup.h"

#include <unistd.h>
#include <stdlib.h>
#include <notify.h>
#include <CoreFoundation/CFString.h>
#include <CoreFoundation/CFArray.h>
#include <CoreFoundation/CFDictionary.h>
#include <Foundation/NSArray.h>
#include <Foundation/NSString.h>

OS_OBJECT_DECL(xpc_object);
#define XPC_RETURNS_RETAINED OS_OBJECT_RETURNS_RETAINED
typedef xpc_object_t xpc_connection_t;
typedef void (^xpc_handler_t)(xpc_object_t object);
#define XPC_ARRAY_APPEND ((size_t)(-1))
extern XPC_RETURNS_RETAINED xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t _Nullable targetq, uint64_t flags);
extern void xpc_connection_set_context(xpc_connection_t connection, void* ctx);
extern void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler);
extern void xpc_connection_activate(xpc_connection_t connection);
extern int xpc_get_type(xpc_object_t object);
extern void xpc_connection_resume(xpc_connection_t connection);
extern XPC_RETURNS_RETAINED xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message);
extern char *xpc_copy_description(xpc_object_t object);
extern XPC_RETURNS_RETAINED xpc_object_t xpc_dictionary_create(const char * _Nonnull const * _Nullable keys, const xpc_object_t _Nullable * _Nullable values, size_t count);
extern void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t _Nullable value);
extern void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *val);
extern void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value);
extern void xpc_dictionary_set_bool(xpc_object_t xdict, const char *key, bool value);
extern XPC_RETURNS_RETAINED xpc_object_t xpc_array_create(const xpc_object_t _Nonnull * _Nullable objects, size_t count);
extern void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value);
extern uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key);


@implementation PlatformSetup

+(void) giveMeRoot {
    
    setuid(0);
    setgid(0);
    int m=getuid();
    int n=getgid();

    NSLog(@"\n gid:%d uid:%d \n",n,m);
}


@end
