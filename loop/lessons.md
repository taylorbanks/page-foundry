# Lessons (append-only; read every iteration)
# format: cause -> rule
TESTS.md fixture phrases in double quotes hit the scanner as real prose -> quote banned-phrase fixtures in backticks (code spans are scanner-exempt)
Edit old_string composed from memory missed "CTA instance" wording -> copy exact file text into old_string, never retype from recall
Quoted research prose in an evidence file tripped the banned-word scan ('arguably' inside a quotation) -> backtick any quoted source text in evidence/records, same rule as fixtures
gh issue view plain output came back empty (exit 0) through the RTK bash wrapper -> fetch issues with gh --json + explicit -R and print via python, never trust empty-but-green gh output
