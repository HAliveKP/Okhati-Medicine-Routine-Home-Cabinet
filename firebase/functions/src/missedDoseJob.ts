import { onSchedule } from "firebase-functions/v2/scheduler";

/** Flags doses with no log after the grace period as Missed; pushes to owner/editors. */
export const missedDoseJob = onSchedule("every 15 minutes", async () => {
  // TODO(A, Sprint 8)
});
