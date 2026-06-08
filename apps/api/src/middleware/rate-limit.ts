import { rateLimit as expressRateLimit, Options } from "express-rate-limit";

/**
 * Standardized rateLimit function for the app.
 * Re-exports the base express-rate-limit function while providing the app's default options.
 */
export const rateLimit = (options?: Partial<Options>) => {
  return expressRateLimit({
    windowMs: 15 * 60 * 1000, // 15 minutes default
    limit: 100, // Limit each IP to 100 requests per `window`
    standardHeaders: "draft-7",
    legacyHeaders: false,
    message: {
      success: false,
      error: {
        code: "TOO_MANY_REQUESTS",
        message: "Rate limit exceeded. Please try again later.",
      },
    },
    ...options,
  });
};

/**
 * Public Tracking Rate Limit
 */
export const publicTrackingLimit = rateLimit({
  windowMs: 15 * 60 * 1000,
  limit: 45,
  message: {
    success: false,
    error: {
      code: "TOO_MANY_REQUESTS",
      message: "Tracking rate limit exceeded. Please try again later.",
    },
  },
});

/**
 * Authentication Rate Limit
 */
export const authLimit = rateLimit({
  windowMs: 60 * 60 * 1000, // 1 hour
  limit: 1000, // Accommodates server-side SSR proxy calls sharing the same local IP
  message: {
    success: false,
    error: {
      code: "AUTH_THROTTLED",
      message: "Too many authentication attempts. Please try again later.",
    },
  },
});

/**
 * Payment Callback Rate Limit
 */
export const callbackLimit = rateLimit({
  windowMs: 1 * 60 * 1000, // 1 minute
  limit: 10,
});
