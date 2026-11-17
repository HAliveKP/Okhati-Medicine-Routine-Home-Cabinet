import { onCall, HttpsError } from "firebase-functions/v2/https";

/** Invites are created/redeemed ONLY here, never from the client. */
export const createInvite = onCall(async (request) => {
  if (!request.auth) throw new HttpsError("unauthenticated", "Sign in required.");
  throw new HttpsError("unimplemented", "TODO(A, Sprint 7)");
});

export const redeemInvite = onCall(async (request) => {
  if (!request.auth) throw new HttpsError("unauthenticated", "Sign in required.");
  throw new HttpsError("unimplemented", "TODO(A, Sprint 7)");
});
