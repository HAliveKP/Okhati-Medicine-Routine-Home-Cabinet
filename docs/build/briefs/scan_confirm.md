# Scan confirm Screen Brief

- Reference image: docs/design/screens/Scan confirm.png
- Frame: 780 × 1688 px, 390 × 844 dp at 2×.
- Group: Home, cabinet and add
- Status: todo; review the exact image again during implementation and visual QA.
- Visible structure: Confirm details form; OCR warning; name, strength, expiry, quantity; visible validation states; Confirm and save and Edit manually.
- Shared visual language measured across exports: canvas #F7FAF9, white surfaces, primary green #1F6F5C, dark ink #1B1F1E, pale green #E6F2EE, outline #E3EAE7. Screen-specific values and uncertain behavior are tracked in docs/build/DECISIONS.md and OPEN_ITEMS.md.
- Navigation: exported raster does not contain prototype links; use labels and screen names provisionally, and record route assumptions in OPEN_ITEMS.md.
- Accessibility: preserve icon + text + color for status, 48 dp minimum touch targets, and test English/Nepali at 150% text.
