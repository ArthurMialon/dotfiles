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
4. If no existing PR, get recent commits using `git log [default-branch]..[current-branch] --oneline`
5. Get file changes using `git diff [default-branch] --name-only`
6. Get diff statistics using `git diff [default-branch] --stat`
7. Get the full diff using `git diff [default-branch]` to understand the actual changes

## Analyze the changes:

1. **Identify affected systems/modules**: Group changes by directory, feature area, or logical component
2. **Categorize change types**: Determine if changes are features, fixes, refactoring, configuration, documentation, etc.
3. **Detect breaking changes**: Look for API changes, removed functionality, or changed behavior
4. **Identify dependencies**: Note if new packages were added or updated
5. **Check for configuration changes**: Environment variables, config files, build scripts

## Generate the PR description:

The output MUST be **pure, clean markdown** that can be directly copy-pasted into GitHub. Follow these strict formatting rules:

- Use proper markdown syntax (headers with `##`, lists with `-`, code with backticks)
- All code identifiers (functions, variables, files, packages) must be wrapped in backticks: `functionName`, `package.json`, `MyComponent`
- File paths should use backticks: `src/components/Header.tsx`
- Use fenced code blocks with language tags for code examples: \`\`\`typescript
- NO conversational text before or after the markdown
- Start directly with the `## Summary` header

### Structure the description as follows:

#### Required sections:

**## Summary**
A brief 2-3 sentence overview of what this PR does and why. Focus on the business value or problem being solved.

**## Changes**
If changes span multiple systems/areas, create subsections. Otherwise, use a simple list.

For **multi-system PRs**, group by area:
```
### Frontend
- Change 1
- Change 2

### Backend
- Change 3
- Change 4

### Configuration
- Change 5
```

For **single-system PRs**, use a flat list:
```
- Change 1
- Change 2
- Change 3
```

#### Optional sections (include only when relevant):

**## ✨ New Features**
List new functionality being added (if applicable)

**## 🐛 Bug Fixes**
List bugs being fixed with brief context (if applicable)

**## 🔄 Refactoring**
List refactoring changes (if applicable)

**## ⚠️ Breaking Changes**
CRITICAL: If there are breaking changes, list them clearly with migration instructions

**## 📦 Dependencies**
List new or updated dependencies (if applicable)
- `package-name@version` - Brief reason for addition/update

**## 🧪 Testing**
- How to test these changes
- What scenarios were tested
- Any manual testing required

**## 📝 Notes**
Additional context, caveats, or future improvements

**## 🔗 Related**
Links to related issues, PRs, or documentation (if applicable)

### Content guidelines:

- Focus on **what** changed and **why**, not **how** (implementation details)
- Use clear, concise language - avoid jargon
- Be specific: Instead of "Updated component", write "Updated `Header` component to support dark mode"
- For TypeScript/code changes, include small examples when they demonstrate new patterns or conventions
- If refactoring affects multiple files, summarize the pattern rather than listing every file
- Keep bullet points scannable - each should be one line if possible

### Example of good formatting:

```markdown
## Summary
Added user authentication system with JWT tokens and role-based access control to secure API endpoints.

## Changes

### Backend
- Implemented JWT authentication middleware in `src/middleware/auth.ts`
- Added `User` model with password hashing using `bcrypt`
- Created authentication routes: `POST /auth/login`, `POST /auth/register`, `POST /auth/refresh`
- Added role-based authorization decorator `@RequireRole()`

### Frontend
- Created `AuthContext` for managing authentication state
- Added login and registration forms with validation
- Implemented automatic token refresh logic
- Updated API client to include JWT token in requests

## 📦 Dependencies
- `jsonwebtoken@9.0.2` - JWT token generation and verification
- `bcrypt@5.1.1` - Password hashing
- `express-validator@7.0.1` - Request validation

## 🧪 Testing
- Run `npm test` to verify all auth flows
- Test login with valid/invalid credentials
- Verify token refresh works after expiration
- Check that protected routes reject unauthenticated requests

## 📝 Notes
Token expiration is set to 15 minutes with 7-day refresh tokens. These values can be configured via `JWT_EXPIRY` and `REFRESH_TOKEN_EXPIRY` environment variables.
```

### Important reminders:

- Output ONLY the markdown content - no conversational wrapper
- Start directly with `## Summary`
- End with the last section - no closing remarks
- The user should be able to copy the entire output and paste it directly into GitHub
