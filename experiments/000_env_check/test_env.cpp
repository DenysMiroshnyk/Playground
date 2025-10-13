#define CATCH_CONFIG_MAIN
#include <catch2/catch_test_macros.hpp>

TEST_CASE("Basic math works", "[math]") {
    REQUIRE(1 + 1 == 2);
}

TEST_CASE("String comparison", "[string]") {
    std::string s = "hello";
    REQUIRE(s == "hello");
}
