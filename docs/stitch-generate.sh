#!/bin/bash
# Script to generate Budget App UI designs using Google Stitch

set -e
WORK_DIR="/Users/yts/lab/planned/budget-app/docs/stitch-designs"
mkdir -p "$WORK_DIR"
LOG_FILE="$WORK_DIR/generation.log"

echo "Starting Stitch Generation for Budget App (PocketLedger)..." > "$LOG_FILE"
TOKEN=$(gcloud auth application-default print-access-token)
export STITCH_ACCESS_TOKEN=$TOKEN
export GOOGLE_CLOUD_PROJECT=lab-apps-490222
export PATH="/opt/homebrew/bin:$PATH"

echo "Creating project..." | tee -a "$LOG_FILE"
PROJECT_JSON=$(stitch-mcp tool create_project -d '{"title": "PocketLedger - Vibecodable"}' -o json)
PROJECT_ID=$(echo "$PROJECT_JSON" | grep -o '"name":"projects/[^"]*' | cut -d'/' -f2 | head -1)

if [ -z "$PROJECT_ID" ]; then
  echo "Failed to create project." | tee -a "$LOG_FILE"
  exit 1
fi

declare -a PROMPTS=(
  "Mobile app home screen for a budget tracker. Dark theme. Top card reads 'Available to Budget: $0.00'. Below is a grid of 'Envelopes' like 'Groceries' ($40 left, green bar) and 'Dining' (-$10, red bar). A giant '+' floating action button in the bottom right."
  "Mobile app transaction entry screen. Dark theme. The top half shows a large amount: '-$12.50' in red. Above it is a horizontally scrolling list of chips to select the category (Groceries is selected). The bottom half is entirely filled with a massive, clean numeric keypad."
  "Mobile app ledger screen. Dark theme. A clean, chronological list of transactions. Each row shows the date, the store name (e.g. 'Publix'), the category tag, and the amount on the right (red for expense, green for income)."
  "Mobile app envelope detail screen. Dark theme. Top shows 'Dining Out' and '$40 Remaining'. Below is a list of transactions just for this envelope. A prominent button at the bottom reads 'Move Money'."
  "Mobile app settings screen. Dark theme. Toggles for 'Require FaceID'. Buttons for 'Export Ledger to JSON' and 'Import Data'. A prominent section highlighting a $19.99 Premium Unlock for unlimited envelopes."
)

declare -a FILENAMES=(
  "01_Dashboard"
  "02_TransactionNumpad"
  "03_Ledger"
  "04_EnvelopeDetail"
  "05_Settings"
)

for i in "${!PROMPTS[@]}"; do
  export STITCH_ACCESS_TOKEN=$(gcloud auth application-default print-access-token)
  PROMPT="${PROMPTS[$i]}"
  FILENAME="${FILENAMES[$i]}"
  
  echo "Generating Screen $((i+1))/5: $FILENAME..." | tee -a "$LOG_FILE"
  SCREEN_JSON=$(stitch-mcp tool generate_screen_from_text -d "{\"projectId\": \"$PROJECT_ID\", \"prompt\": \"$PROMPT\"}" -o json || true)
  SCREEN_ID=$(echo "$SCREEN_JSON" | grep -o '"name":"projects/[^"]*/screens/[^"]*' | cut -d'/' -f4 | head -1)
  
  if [ -n "$SCREEN_ID" ]; then
    echo "  Success! Screen ID: $SCREEN_ID" | tee -a "$LOG_FILE"
    CODE_JSON=$(stitch-mcp tool get_screen_code -d "{\"projectId\": \"$PROJECT_ID\", \"screenId\": \"$SCREEN_ID\"}" -o json || true)
    echo "$CODE_JSON" > "$WORK_DIR/$FILENAME.json"
    echo "  Saved to $FILENAME.json" | tee -a "$LOG_FILE"
  else
    echo "  Failed to generate screen. Response: $SCREEN_JSON" | tee -a "$LOG_FILE"
  fi
done
echo "All tasks completed!" | tee -a "$LOG_FILE"