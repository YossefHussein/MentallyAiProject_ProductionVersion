import rateLimit from 'express-rate-limit';

const rateLimiter = rateLimit({
    windowMs: 30 * 60 * 1000, // 1 minutes
    limit: 10, // Limit each IP to 100 requests per `window` (here, per 15 minutes)
    standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
    legacyHeaders: false, // Disable the `X-RateLimit-*` headers
    ipv6Subnet: 56, // Set to 60 or 64 to be less aggressive, or 52 or 48 to be more aggressive
    message: {
        message: "Too many requests, please try again later.",
    },
});

export default rateLimiter;