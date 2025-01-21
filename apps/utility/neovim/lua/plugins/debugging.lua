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

		dap.adapters.cppdbg = {
		  id = 'cppdbg',
		  type = 'executable',
		  command = '/nix/store/gwags66qlqr6qmblwp0v6crkb6ca2qr1-vscode-extension-ms-vscode-cpptools-1.22.2/share/vscode/extensions/ms-vscode.cpptools/debugAdapters/bin/OpenDebugAD7',
		}

		dap.configurations.rust = {
		  {
		    name = "Launch file",
		    type = "cppdbg",
		    request = "launch",
		    program = function()
		      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		    end,
		    cwd = '${workspaceFolder}',
		    stopAtEntry = true,
		  },
		  {
		    name = 'Attach to gdbserver :1234',
		    type = 'cppdbg',
		    request = 'launch',
		    MIMode = 'gdb',
		    miDebuggerServerAddress = 'localhost:1234',
		    miDebuggerPath = '/usr/bin/gdb',
		    cwd = '${workspaceFolder}',
		    program = function()
		      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		    end,
		  },
		}

		vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
		vim.keymap.set('n', '<Leader>dc', dap.continue, {})
	end
}
