import { onSchedule } from "firebase-functions/v2/scheduler";

/** Daily low-stock and expiry alerts. */
export const stockExpiryJob = onSchedule("every day 08:00", async () => {
  // TODO(A/B, Sprint 8)
});
