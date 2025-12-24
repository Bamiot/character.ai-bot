if (
  process.env.DISCORD_BOT_TOKEN &&
  process.env.CHARACTER_AI_AUTH_TOKEN &&
  process.env.BOT_STATUS_TEXT &&
  process.env.DEFAULT_CHARACTER_ID
) {
  config = {
    token: process.env.DISCORD_BOT_TOKEN,
    authToken: process.env.CHARACTER_AI_AUTH_TOKEN,
    status: process.env.BOT_STATUS_TEXT,
    defaultCharacter: process.env.DEFAULT_CHARACTER_ID,
  };
} else {
  config = require("./config.json"); // Specifies the config file
}

module.exports = config;
