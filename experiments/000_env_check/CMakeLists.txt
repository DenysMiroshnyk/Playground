add_executable(test_env test_env.cpp)

find_package(Catch2 REQUIRED)
target_link_libraries(test_env PRIVATE Catch2::Catch2WithMain)

enable_testing()
add_test(NAME test_env COMMAND test_env)
