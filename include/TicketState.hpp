#pragma once  
#include <string>
#include <chrono>

enum class TicketStatus
{
  PENDING,
  APPROVED,
  DISMISSED,
  AWAITING_HUMAN
};

struct TicketState
{
  std::string id;
  std::size_t content_hash;
  std::string suggestion;
  int score;
  std::string summary;
  std::chrono::system_clock::time_point first_seen;
  std::chrono::system_clock::time_point last_processed;
  TicketStatus status;
  std::string raw_conversation;
};
