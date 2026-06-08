import Redis from "ioredis";

const REDIS_URL = process.env.REDIS_URL || "redis://localhost:6379";

class RedisClient {
  private static instance: Redis | null = null;

  public static getInstance(): Redis {
    if (!RedisClient.instance) {
      RedisClient.instance = new Redis(REDIS_URL, {
        retryStrategy(times) {
          const delay = Math.min(times * 50, 2000);
          return delay;
        },
      });

      RedisClient.instance.on("error", (err) => {
        console.error("Redis Error:", err);
      });
    }
    return RedisClient.instance;
  }

  // Live Stats Helpers
  public static async trackLogin(userId: string, deviceId: string) {
    const redis = RedisClient.getInstance();
    const pipeline = redis.pipeline();

    // Globally count active users (unique)
    pipeline.sadd("active_users", userId);
    // Globally count active devices (unique)
    pipeline.sadd("active_devices", deviceId);

    // Track per-user device count (optional but useful)
    pipeline.sadd(`user:${userId}:devices`, deviceId);

    await pipeline.exec();
  }

  public static async trackLogout(userId: string, deviceId: string) {
    const redis = RedisClient.getInstance();
    const pipeline = redis.pipeline();

    // De-tracking logic might be complex if we want true "is currently online"
    // vs "has an active session". For "Logged in Users", we just keep them in the set.
    // If we want real-time, we should use a TTL or heartbeat.
    // For now, we follow the user's "Increment on login, decrement on logout" simplified model.
    pipeline.srem("active_users", userId);
    pipeline.srem("active_devices", deviceId);

    await pipeline.exec();
  }

  public static async getMetrics() {
    const redis = RedisClient.getInstance();
    const [activeUsers, activeDevices] = await Promise.all([
      redis.scard("active_users"),
      redis.scard("active_devices"),
    ]);
    return { activeUsers, activeDevices };
  }
}

export const redis = RedisClient.getInstance();
export const trackLogin = RedisClient.trackLogin;
export const trackLogout = RedisClient.trackLogout;
export const getRedisMetrics = RedisClient.getMetrics;
