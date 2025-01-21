return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters.codelldb = {
		  type = "executable",
		  command = "codelldb", 
		}

		dap.configurations.rust = {
		  {
		    name = "Launch file",
		    type = "codelldb",
		    request = "launch",
		    program = function()
		      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		    end,
		    cwd = '${workspaceFolder}',
		    stopOnEntry = false,
		  },
		}

		vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
		vim.keymap.set('n', '<Leader>dc', dap.continue, {})
	end
}
