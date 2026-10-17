# Open Questions

## Blocking (need answers before writing related code)
- Exact URL regex for extracting ticket ID from /customer_support/<id>
- Where on screen is the URL bar relative to the PiKVM frame (pixel coords)?
- How long to wait after "send" before rescanning for hash update?
- Does the human's "Edit" action modify the response before sending?

## Scan behavior
- Scroll step size (overlap %)
- Settle time per scroll (how long to wait for render)
- Max scroll cap (messages / screens / time)
- What if conversation is short enough to fit on one screen?

## Prompt template (DeepSeek)
- Full prompt format
- Does the LLM see previous attempts (feedback loop)?
- Response catalog format: fields, categories, size

## Edge cases
- Customer edits a previously-sent message — how does hash handle it?
- Image attachments in messages — OCR only, or extract URLs?
- Human "Skips" a ticket, then customer replies — bot retries? (currently yes)
- What if screen shows a login/error page instead of support UI?

## Sleep mode
- Wake button: after sleep, bot starts from URL check again — confirm
- "Print anyway" — does it type the response via PiKVM, or open in app?
