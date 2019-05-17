# fisherman
Detect fishy hackathon submissions

Methods
---

Uses [Github API](https://developer.github.com/v3/repos/statistics/)

Marks repository as "fishy" (read: suspicious) if any of below are met:
1. has fewer than 5 commits
2. has a few extremely large commits (eg. > 200 lines)
3. the first commit is dated before the hackathon start date.

Disclaimer: There will obviously be a lot of false positives in repositories that are marked as fishy. However, the goal of this project is not to judge which projects are fishy, but instead highlight *potentially* suspicious repos for further investigation by **humans**.


