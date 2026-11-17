import { onCall, HttpsError } from "firebase-functions/v2/https";

/**
 * ONE gateway for all LLM calls (chatbot, OCR parsing, insight wording).
 * API keys live ONLY here (Firebase secrets), never in the Flutter app.
 * Swap provider (Gemini / Claude / OpenAI) by editing this file only.
 *
 * Safety (NON-NEGOTIABLE): refuse diagnosis, dosage, interactions,
 * "should I take"; redirect to doctor/pharmacist; emergencies -> local
 * emergency services. Send minimum data; do not log health data.
 */
export const aiProxy = onCall(async (request) => {
  if (!request.auth) throw new HttpsError("unauthenticated", "Sign in required.");
  // TODO(D, Sprint 8): task = "chat" | "parseLabel" | "insight"
  throw new HttpsError("unimplemented", "aiProxy not implemented yet.");
});
