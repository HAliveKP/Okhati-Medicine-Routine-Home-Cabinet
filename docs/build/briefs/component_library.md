# Shared Component Library Brief

This export contains no isolated component frames, so use repeated examples in the following offline screens and keep implementations aligned to their measured pixels:

- `docs/design/screens/Today.png`: dose cards, status chips, Taken/Snooze actions, weekly insight, quick action tiles, bottom navigation.
- `docs/design/screens/Cabinet.png`: search affordance, filter pills, medicine cards, status chips, floating add action, selected bottom-navigation tab.
- `docs/design/screens/Medicine details.png`: summary card, three statistic tiles, disclosure tiles, primary dose action.
- `docs/design/screens/Add medicine.png`: top bar, scan callout, labeled form fields, selector rows, reminder tile, pinned primary action.
- `docs/design/screens/Condition tags.png`: selectable tag rows and completion action.
- `docs/design/screens/Settings.png`: language segmented control, text-size slider, switches, settings rows, destructive outline row.
- `docs/design/screens/Cabinet - No results.png`: empty-search state with illustration and recovery actions.
- `docs/design/screens/Family.png` and `Manage members.png`: profile switcher/avatars, role chips, permission toggles.

## Measured shared values

- Screen exports: 390 × 844 dp at 2×.
- Content inset on Today/Cabinet: 40 px = 20 dp.
- Main card corner radius: 12 dp from the 24 px top-edge inset on the Today/Cabinet/Medicine details cards; primary CTA corner radius: 16 dp from the 32 px arc on Add medicine.
- Bottom navigation region: 168 px = 84 dp.
- Main palette: background `#F7FAF9`, surface `#FFFFFF`, primary `#1F6F5C`, text `#1B1F1E`, secondary `#5B6663`, border `#E3EAE7`, pale green `#E6F2EE`.
- Use 4 dp increments and shared constants. Every touch target is at least 48 dp; the dose Taken action remains at least 56 dp.

No component can be recorded as visually accepted until a screenshot comparison table exists for the gallery/reference component.
