Config = {}

Config.ProximityDistance = 20.0

Config.WebhookURL = "https://discord.com/api/webhooks/YOUR_WEBHOOK_HERE"

-- Outcome modes: "fixed", "random", "balanced"
-- "fixed": uses Config.SuccessChance (0.0 - 1.0)
-- "random": fully random each time
-- "balanced": strict 50/50 chance
Config.OutcomeMode = "random"

-- Only used if OutcomeMode = "fixed"
Config.SuccessChance = 0.7  -- 70% success
