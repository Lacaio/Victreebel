cmake_minimum_required(VERSION 3.20)

project(victreebel
    VERSION 0.1.0
    DESCRIPTION "Automated customer support agent"
    LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(spdlog REQUIRED)
find_package(nlohmann_json REQUIRED)

add_executable(victreebel
    src/main.cpp
    src/hash.cpp)

target_include_directories(victreebel PRIVATE include)
  
target_link_libraries(victreebel
    PRIVATE
          spdlog::spdlog
          nlohmann_json::nlohmann_json)
