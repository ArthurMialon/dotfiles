You are creating a Pull Request description.

If a PR number is provided as an argument, use it to fetch the PR information and diff.
If no PR number is provided, gather information from the current branch.

## When PR number is provided:
1. Use `gh pr view <PR_NUMBER>` to get PR details (title, description, commits)
2. Use `gh pr diff <PR_NUMBER>` to get the full diff
3. Use the commits from the PR to understand what changes were made

## When no PR number is provided:
1. Check the current git branch using `git rev-parse --abbrev-ref HEAD`
2. Determine the default branch (usually main or master)
3. Try to get the PR from GitHub using `gh pr view [branch]` (if it exists)
4. If no existing PR, get recent commits using `git log [default-branch]..[current-branch]`
5. Get file changes using `git diff [default-branch] --name-only`
6. Get diff statistics using `git diff [default-branch] --stat`

Then analyze this information and generate a concise, professional PR description that:

- Starts with a brief 1-2 sentence summary of the main change
- Includes 3-5 bullet points of key changes
- Notes any testing considerations or breaking changes (if applicable)
- Uses clean, easy-to-read markdown formatting
- Focuses on "what" and "why", not implementation details
- Is suitable for a professional Pull Request

Don't hesitate to propose TS example if the diff add new imporant system and/or conventions.

Format the output as:

## Summary
[Brief overview]

## Changes
- [Key change 1]
- [Key change 2]
- [Key change 3]

## Notes
[Any testing notes, breaking changes, or other important information]

Keep it concise and professional. Avoid unnecessary jargon.
