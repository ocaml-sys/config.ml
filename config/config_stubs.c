#include <caml/memory.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <string.h>

CAMLprim value caml_config_target_env(value unit) {
  CAMLparam1(unit);
  CAMLlocal1(env_string);

  const char* env =
    #if defined(__GLIBC__)
      "gnu"

    #elif _MSC_VER
      "msvc"

    #elif defined(__linux__) && !defined(__GLIBC__)
      "musl"

    #else
      ""
    #endif
;

  env_string = caml_alloc_string(strlen(env));
  memcpy((char*) String_val(env_string), env, strlen(env));
  CAMLreturn(env_string);
}

CAMLprim value caml_config_target_os(value unit) {
  CAMLparam1(unit);
  CAMLlocal1(os_string);

  const char* os =
    #if defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__)
      "windows"

    #elif __APPLE__
      #include <TargetConditionals.h>
      #if TARGET_OS_IPHONE
        "ios"
      #elif TARGET_OS_TV
        "tvos"
      #elif TARGET_OS_WATCH
        "watchos"
      #elif TARGET_OS_MAC
        "macos"
      #endif

    #elif __FreeBSD__
      "freebsd"

    #elif __NetBSD__
      "netbsd"

    #elif __ANDROID__
      "android"

    #elif __linux__
      "linux"

    #else
      "unknown"
    #endif
;

  os_string = caml_alloc_string(strlen(os));
  memcpy((char*) String_val(os_string), os, strlen(os));
  CAMLreturn(os_string);
}

CAMLprim value caml_config_target_arch(value unit) {
  CAMLparam1(unit);
  CAMLlocal1(arch_string);

  const char* arch =
#if defined(__x86_64__) || defined(_M_X64)
    "x86_64"
#elif defined(__i386__) || defined(_M_IX86)
    "x86"
#elif defined(__aarch64__)
    "aarch64"
#elif defined(__arm__) || defined(_M_ARM)
    "arm"
#else
    "unknown"
#endif
;

  arch_string = caml_alloc_string(strlen(arch));
  memcpy((char*) String_val(arch_string), arch, strlen(arch));
  CAMLreturn(arch_string);
}

