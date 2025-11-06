You are tasked with finding and summarizing all @TODO comments in the codebase.

Follow these steps:

1. Search for all @TODO comments in the codebase by running a grep search
2. Collect all results and organize them by file
3. Create a summary organized by file with:
   - The file path
   - Line number
   - The @TODO comment text
   - A clickable link in the format: `file_path:line_number`

4. After listing all TODOs, provide a brief summary:
   - Total number of TODOs found
   - Group them by category (feature, bug, refactor, optimize, etc.) if possible
   - Highlight any high-priority items

Format your output as follows:

## All @TODO Items

### [File 1]
- **Line X**: [TODO text] → `file_path:line_number`
- **Line Y**: [TODO text] → `file_path:line_number`

### [File 2]
- **Line Z**: [TODO text] → `file_path:line_number`

## Summary
- Total TODOs: X
- By Category:
  - Feature: X
  - Bug Fix: X
  - Refactor: X
  - [Other categories]: X

## Quick Links
Include a summary of the most important TODOs that need immediate attention.

Important notes:
- Search the entire codebase recursively
- Include common code comment formats: //@TODO, # @TODO, <!-- @TODO -->, etc.
- Only return TODOs that are marked with @TODO (case-sensitive)
- Exclude node_modules and other common non-source directories
- If no TODOs are found, let the user know the codebase is TODO-free!
