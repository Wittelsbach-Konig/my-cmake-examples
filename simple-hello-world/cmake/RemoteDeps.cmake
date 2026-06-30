include(FetchContent)

FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG 52eb8108c5bdec04579160ae17225d66034bd723 # release 1.17.0
)

FetchContent_Declare(
  SDL3
  GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
  GIT_TAG 8e37db5e797b6167f3a00d697d816a684bd259c7 # release 3.4.10
)

FetchContent_MakeAvailable(googletest SDL3)
