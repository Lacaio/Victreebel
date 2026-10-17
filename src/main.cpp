#include "spdlog/spdlog.h"

int main(void)
{

  spdlog::info("Welcome to spdlog!");
  spdlog::info("compiled with C++{}", __cplusplus);
  return(0);
}
