return {
  -- For customization, refer to Install > Configuration in the Documentation/Readme
  providers = {
    ollama = {
      endpoint = "http://localhost:11434/v1/chat/completions",
    },
    copilot = {
      endpoint = "https://api.githubcopilot.com/chat/completions",
      secret = {
        "bash",
        "-c",
        "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
      },
    },
  },

  default_command_agent = "ChatCopilot",
  default_chat_agent = "ChatCopilot",

  agents = {
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
    {
      provider = "copilot",
      name = "ChatCopilot",
      chat = true,
      command = false,
      model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
      system_prompt = require("gp.defaults").chat_system_prompt,
    },
  },
  hooks = {
    -- example of adding command which explains the selected code
    Explain = function(gp, params)
      local template = "I have the following code from {{filename}}:\n\n"
      .. "```{{filetype}}\n{{selection}}\n```\n\n"
      .. "Please respond by explaining the code above."
      local agent = gp.get_chat_agent()
      gp.Prompt(params, gp.Target.popup, agent, template)
    end,

    -- example of adding command which writes unit tests for the selected code
    UnitTests = function(gp, params)
      local template = "I have the following code from {{filename}}:\n\n"
      .. "```{{filetype}}\n{{selection}}\n```\n\n"
      .. "Please respond by writing table driven unit tests for the code above."
      local agent = gp.get_command_agent()
      gp.Prompt(params, gp.Target.vnew, agent, template)
    end,
  }
}
