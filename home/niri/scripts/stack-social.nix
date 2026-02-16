{pkgs}:

pkgs.writeShellScript "stack-social" ''
  niri="${pkgs.niri-unstable}/bin/niri"
  jq="${pkgs.jq}/bin/jq"

  # Wait until all 3 social apps have opened
  for i in $(seq 1 30); do
    windows=$($niri msg -j windows 2>/dev/null)
    vesktop=$(echo "$windows" | $jq -r '[.[] | select(.app_id == "vesktop")] | .[0].id // empty')
    telegram=$(echo "$windows" | $jq -r '[.[] | select(.app_id == "org.telegram.desktop")] | .[0].id // empty')
    whatsapp=$(echo "$windows" | $jq -r '[.[] | select(.app_id == "whatsapp-electron")] | .[0].id // empty')

    if [ -n "$vesktop" ] && [ -n "$telegram" ] && [ -n "$whatsapp" ]; then
      sleep 1

      # Move all three to the far left in a known order
      $niri msg action focus-window --id "$vesktop"
      sleep 0.2
      $niri msg action move-column-to-first
      sleep 0.2
      $niri msg action focus-window --id "$telegram"
      sleep 0.2
      $niri msg action move-column-to-first
      sleep 0.2
      $niri msg action focus-window --id "$whatsapp"
      sleep 0.2
      $niri msg action move-column-to-first
      sleep 0.2

      # Order is now: [whatsapp] [telegram] [vesktop] (left to right)
      # Consume the two windows to the right into whatsapp's column
      $niri msg action consume-window-into-column
      sleep 0.2
      $niri msg action consume-window-into-column
      sleep 0.2

      # Set the stacked column to full width
      $niri msg action set-column-width "100%"
      exit 0
    fi
    sleep 1
  done
''
