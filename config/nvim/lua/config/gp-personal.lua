return {
  providers = {
    openai = {
      secret = os.getenv("OPENAI_API_KEY")
    },
    anthropic = {
      secret = os.getenv("ANTHROPIC_API_KEY")
    },
    ollama = {
      endpoint = "http://localhost:11434/v1/chat/completions",
    },
  },
  default_command_agent = "ChatClaude-3-5-Sonnet",
  default_chat_agent = "ChatClaude-3-5-Sonnet",
  agents = {
    {
 			name = "ChatGPT4o",
 			chat = true,
 			command = false,
 			model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
 			system_prompt = require("gp.defaults").chat_system_prompt,
 		},
    {
 			provider = "anthropic",
 			name = "ChatClaude-3-5-Sonnet",
 			chat = true,
 			command = false,
 			model = { model = "claude-sonnet-4-20250514", temperature = 0.8, top_p = 1 },
 			system_prompt = require("gp.defaults").chat_system_prompt,
 		},
    {
      provider = "ollama",
      name = "mistral-nemo",
      chat = true,
      command = false,
      -- string with model name or table with model name and parameters 
      model = {
        model = "mistral-nemo",
        temperature = 0.6,
        top_p = 1,
        min_p = 0.05,
      },
      -- system prompt (use this to specify the persona/role of the AI) 
      system_prompt = "You are a general AI assistant.",
    },
  },
}
