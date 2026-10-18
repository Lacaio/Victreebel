#include <string>
#include <cstdint>

std::size_t fnvla_hash(const std::string& text)
{
  std::size_t hash = 14695981039346656037ULL;
  std::size_t prime = 1099511628211ULL;

  for (char c : text)
  {
    hash ^= static_cast<std::size_t>(c);
    hash *= prime;
  }
    return hash;
}
