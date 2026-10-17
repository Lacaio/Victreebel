# Decisions

## 2026-10-16 — Language: C++
Reason: closest to C, which I already know. Rust ruled out.
Revisit if: never.

## 2026-10-16 — LLM: DeepSeek
Reason: OpenAI-compatible API, cost-effective.
Implication: LLMClient wraps a base_url + api_key + model_name.
Revisit if: cost, latency, or quality becomes a problem.

## 2026-10-16 — GUI: wxWidgets
Reason: native look and feel, lighter than Qt, good threading docs.
Revisit if: need a drastically richer UI.

## 2026-10-16 — Compiler: GCC 14.2 on Debian
Reason: primary dev machine. C++20.
Implication: link target is Linux x86_64 for now.
Revisit if: cross-platform becomes a real requirement.

## 2026-10-16 — Threading: GUI thread + one worker thread
Reason: worker runs capture + judge loop; communicates via events.
Revisit if: LLM latency starves capture loop.

## 2026-10-16 — Cooperative cancellation, no thread kill
Reason: no safe way to terminate a thread mid-operation in C++.
Implication: every blocking call needs a timeout; worker checks
             std::atomic<bool> stop flag at safe points.

## 2026-10-16 — Sleep mode is a worker state, not a thread exit
Reason: cheaper to signal than tear down and rebuild.
Implication: worker sits on condition_variable in SLEEPING.
             Requires human action (Quit / Reset / Print anyway) to exit.

## 2026-10-16 — Judge loop: max 3 attempts, threshold 8/10
Reason: 3 strikes → awaiting_human_input → sleep mode.

## 2026-10-16 — Drop per-ticket JSON storage
Reason: LLM sees fresh scan every time; saved conversations serve no
        downstream purpose. In-session dedup suffices.
Implication: ticket state lives in-memory (unordered_map keyed by ID).
             Audit via spdlog rotating log file.
Revisit if: cross-restart review queue needed, or analytics.

## 2026-10-16 — Content hash for in-session dedup
Reason: URL check triggers scan; hash answers "did content change?"
Implication: FNV-1a (stable across builds) on OCR'd conversation text.
             NOT std::hash (implementation-defined, unstable across builds).

## 2026-10-16 — Content hash tracks state at last action, not last scan
Reason: bot's own sent response changes the conversation.
Implication: post-send, wait for screen to settle, rescan, update hash.

## 2026-10-16 — URL region as primary trigger
Reason: URL bar is stable and cheap to OCR; avoids cursor/clock false positives.
Implication: url.com/customer_support/  → no ticket
             url.com/customer_support/<id> → ticket present

## 2026-10-16 — APPROVED and DISMISSED are not terminal states
Reason: customer can reopen a ticket; bot must re-process on content change.
Implication: content hash change on any status → transition to PENDING.

## 2026-10-16 — Reopened tickets: full rescan, not incremental
Reason: incremental scan adds significant complexity for ~15s saved.
Implication: revisit only if it proves painful.

## 2026-10-16 — Bot is an active agent, not just observer
Reason: need to scroll through long conversations to build full context.
Implication: InputController module; 3-stage pipeline (Monitor → Scan → Process).

## 2026-10-16 — No per-ticket directory structure
Reason: no per-ticket files to organize.
Implication: delete data/tickets/. Keep data/frames/ for review-UI screenshots.
