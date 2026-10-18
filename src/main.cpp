#include "spdlog/spdlog.h"
#include "TicketState.hpp"
#include <iostream>

int main(void)
{

  TicketState my_ticket = {"1234567890", 1234567890, "They hate each other, it is the battle of the gods", 8,
  "Not good she hates us very much, help!", std::chrono::system_clock::now(), std::chrono::system_clock::now(), TicketStatus::AWAITING_HUMAN, 
  "just a bunch of random stuff here!!! oh"};
  TicketStatus my_ticket_status = TicketStatus::PENDING;
  std::cout << "Ticket status integer value: " << static_cast<int>(my_ticket.status) << std::endl;

  spdlog::info("welcome to spdlog!");
  spdlog::info("compiled with c++{}", __cplusplus);
  return 0;
}
