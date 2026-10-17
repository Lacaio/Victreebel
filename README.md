# Victreebel

Automated customer support assistant with human-in-the-loop review.

## What it is

Victreebel watches a customer support tool (via PiKVM) or receives tickets
directly via JSON API, extracts the conversation, and asks an LLM to select
one pre-written response from a human-authored catalog. The response is
presented to a human for approval before being sent back through the support
tool. Nothing is ever sent automatically.

## Why

Reduce the time spent on routine customer support tickets while keeping a
human in the loop for anything ambiguous or sensitive. The LLM does not
author responses — it selects from a fixed catalog and rates its own
confidence. Responses scoring below 8/10 across three attempts are escalated
to the human with no suggestion.

## Two ingest paths

- **Visual (PiKVM):** the bot captures screenshots of a remote support
  workstation, detects new tickets from the URL, and scrolls through long
  conversations to build full context.
- **API:** tickets arrive as JSON over HTTP.

Both paths produce a canonical `Ticket` that flows through the same pipeline.

## Design principles

- Human approval before any message is sent
- LLM selects from a fixed catalog, does not invent responses
- Audit trail via rotating logs
- No conversation history is persisted by default

## Status

Work in progress. See `docs/PROGRESS.md` for current state.
