return {
  -- 'Hoffs/omnisharp-extended-lsp.nvim',
  -- config = function()
  --   local pid = vim.fn.getpid()
  --   -- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
  --   local omnisharp_bin = '/home/hendry/.local/share/nvim/mason/bin/omnisharp'
  --   -- on Windows
  --   -- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"
  --
  --   local config = {
  --     handlers = {
  --       ['textDocument/definition'] = require('omnisharp_extended').definition_handler,
  --       ['textDocument/typeDefinition'] = require('omnisharp_extended').type_definition_handler,
  --       ['textDocument/references'] = require('omnisharp_extended').references_handler,
  --       ['textDocument/implementation'] = require('omnisharp_extended').implementation_handler,
  --     },
  --
  --     cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
  --     enable_editorconfig_support = true,
  --
  --     -- If true, MSBuild project system will only load projects for files that
  --     -- were opened in the editor. This setting is useful for big C# codebases
  --     -- and allows for faster initialization of code navigation features only
  --     -- for projects that are relevant to code that is being edited. With this
  --     -- setting enabled OmniSharp may load fewer projects and may thus display
  --     -- incomplete reference lists for symbols.
  --     enable_ms_build_load_projects_on_demand = false,
  --
  --     -- Enables support for roslyn analyzers, code fixes and rulesets.
  --     enable_roslyn_analyzers = false,
  --
  --     -- Specifies whether 'using' directives should be grouped and sorted during
  --     -- document formatting.
  --     organize_imports_on_format = false,
  --
  --     -- Enables support for showing unimported types and unimported extension
  --     -- methods in completion lists. When committed, the appropriate using
  --     -- directive will be added at the top of the current file. This option can
  --     -- have a negative impact on initial completion responsiveness,
  --     -- particularly for the first few completion sessions after opening a
  --     -- solution.
  --     enable_import_completion = false,
  --
  --     -- Specifies whether to include preview versions of the .NET SDK when
  --     -- determining which version to use for project loading.
  --     sdk_include_prereleases = true,
  --
  --     -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  --     -- true
  --     analyze_open_documents_only = false,
  --     -- rest of your settings
  --   }
  --
  --   require('lspconfig').omnisharp.setup(config)
  --
  --   vim.cmd [[
  --     nnoremap gd <cmd>lua require('omnisharp_extended').lsp_definition()<cr>
  --     nnoremap <leader>D <cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>
  --     nnoremap gr <cmd>lua require('omnisharp_extended').lsp_references()<cr>
  --     nnoremap gi <cmd>lua require('omnisharp_extended').lsp_implementation()<cr>
  --     ]]
  -- end,
}
