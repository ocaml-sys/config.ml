#include <stdio.h>

int main() {
    // Windows Platform
    #if defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__)
      #ifdef _WIN64
          printf("windows"); return 0;
      #else
          printf("windows"); return 0;
      #endif
    #endif

    // Apple Platforms
    #if __APPLE__
        #include <TargetConditionals.h>
        #elif TARGET_OS_IPHONE
            printf("ios"); return 0;
        #elif TARGET_OS_TV
            printf("tvos"); return 0;
        #elif TARGET_OS_WATCH
            printf("watchos"); return 0;
        #elif TARGET_OS_MAC
            printf("macos"); return 0;
        #endif

    // Android Platform
    #if __ANDROID__
        printf("android"); return 0;
    #endif

    // Linux Platform
    #if __linux__
        printf("linux"); return 0;
    #endif

    printf("unknown");
    return 0;
}
