function(build_cpp_redis)
  include(ExternalProject)
  set(CPP-REDIS_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/cpp_redis")
  set(CPP-REDIS_BINARY_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/cpp_redis/build")
  set(cpp-redis_CMAKE_ARGS "${CPP-REDIS_SOURCE_DIR} -DCMAKE_BUILD_TYPE=Release")

  ExternalProject_Add(cpp_redis_ext
    SOURCE_DIR "${CPP-REDIS_SOURCE_DIR}"
    BINARY_DIR "${CPP-REDIS_BINARY_DIR}"
    CMAKE_ARGS "${cpp-redis_CMAKE_ARGS}"
    BUILD_COMMAND ""
    INSTALL_COMMAND "")

  set(CPP_REDIS_INCLUDE_DIR "/usr/local/include")
  set(CPP_REDIS_LIBRARIES "/usr/local/lib/libcpp_redis.a")

  add_library(cpp_redis::cpp_redis STATIC IMPORTED)
  add_dependencies(cpp_redis::cpp_redis cpp_redis_ext)
 endfunction()

