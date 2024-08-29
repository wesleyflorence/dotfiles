-- lazy.nvim
return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
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
    require("gp").setup(conf)

    require("which-key").add({
      -- VISUAL mode mappings
      -- s, x, v modes are handled the same way by which_key
      {
        mode = { "v" },
        nowait = true,
        remap = false,
        { "<leader>a", group = "ai" },
        { "<leader>av", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "ChatNew vsplit" },
        { "<leader>aV", ":<C-u>'<,'>GpChatNew split<cr>", desc = "ChatNew split" },
        { "<leader>ao", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)" },
        { "<leader>aO", ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual Prepend (before)" },
        { "<leader>ac", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New" },
        { "<leader>ap", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup" },
        -- { "<leader>ag", group = "generate into new .." },
        -- { "<leader>age", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew" },
        -- { "<leader>agn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew" },
        -- { "<leader>agv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew" },
        { "<leader>ai", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection" },
        { "<leader>an", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<leader>ap", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste" },
        { "<leader>ar", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite" },
        { "<leader>aq", "<cmd>GpStop<cr>", desc = "GpStop" },
        { "<leader>aa", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat" },
        { "<leader>a<enter>", ":<C-u>'<,'>GpChatRespond<cr>", desc = "Chat Respond" },
        { "<leader>ax", ":<C-u>'<,'>GpContext<cr>", desc = "Visual GpContext" },
        { "<leader>aA", group = "code" },
        { "<leader>aAe", ":<C-u>'<,'>GpExplain<cr>", desc = "Explain the code" },
        { "<leader>aAt", ":<C-u>'<,'>GpUnitTests<cr>", desc = "Write UnitTests" },
      },

      -- NORMAL mode mappings
      {
        mode = { "n" },
        nowait = true,
        remap = false,
        { "<leader>a", group = "ai" },
        { "<leader>av", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
        { "<leader>aV", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
        { "<leader>ao", "<cmd>GpAppend<cr>", desc = "Append (after)" },
        { "<leader>aO", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
        { "<leader>ac", "<cmd>GpChatNew<cr>", desc = "New Chat" },
        { "<leader>ac", "<cmd>GpChatNew<cr>", desc = "New Chat" },
        { "<leader>ad", "<cmd>GpChatDelete<cr>", desc = "Delete Chat" },
        { "<leader>af", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
        -- { "<leader>ag", group = "generate into new .." },
        -- { "<leader>age", "<cmd>GpEnew<cr>", desc = "GpEnew" },
        -- { "<leader>agn", "<cmd>GpNew<cr>", desc = "GpNew" },
        -- { "<leader>agv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
        { "<leader>ap", "<cmd>GpPopup<cr>", desc = "Popup" },
        { "<leader>an", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<leader>ar", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
        { "<leader>aq", "<cmd>GpStop<cr>", desc = "GpStop" },
        { "<leader>aa", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
        { "<leader>a<enter>", "<cmd>GpChatRespond<cr>", desc = "Chat Respond" },
        { "<leader>ax", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
      },

      -- INSERT mode mappings
      {
        mode = { "i" },
        nowait = true,
        remap = false,
        { "<leader>a", group = "ai" },
        { "<leader>av", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
        { "<leader>aV", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
        { "<leader>ao", "<cmd>GpAppend<cr>", desc = "Append (after)" },
        { "<leader>aO", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
        { "<leader>ac", "<cmd>GpChatNew<cr>", desc = "New Chat" },
        { "<leader>af", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
        -- { "<leader>ag", group = "generate into new .." },
        -- { "<leader>age", "<cmd>GpEnew<cr>", desc = "GpEnew" },
        -- { "<leader>agn", "<cmd>GpNew<cr>", desc = "GpNew" },
        -- { "<leader>agv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
        { "<leader>ap", "<cmd>GpPopup<cr>", desc = "Popup" },
        { "<leader>an", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
        { "<leader>ar", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
        { "<leader>aq", "<cmd>GpStop<cr>", desc = "GpStop" },
        { "<leader>aa", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
        { "<leader>a<enter>", "<cmd>GpChatRespond<cr>", desc = "Chat Respond" },
        { "<leader>ax", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
      },
    })
  end,
}
