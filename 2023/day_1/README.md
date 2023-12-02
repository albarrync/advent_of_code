## Day 1 Thoughts
### Part 1
Really straightfoward approach using  the `\d` regex character class escape.

### Part 2
Originally tried to replace entire strings with `gsub`. This was an issue where characters overlapped and were shared between two chars.
I think gsub could still be fast, but it'd look a little hacky.
I was planning to try to preserve the first and last character of the matching word, and then continuing the `\d` scan like Part 1.
e.g. `1eighthree4` # gsub => `1e8t3e4`

I decided to just scan through the line and push matches into an array.

### Overall
Didn't have much time to spend on these today, so these solutions just `puts` at the end of the run.
Maybe I'll have some more structured scripting -necessarily- for the upcoming days.
