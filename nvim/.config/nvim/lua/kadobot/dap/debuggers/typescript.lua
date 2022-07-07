local M = {}

M.adapters = {}

M.adapters.typescript = {
    type = 'executable',
    command = 'ts-node',
    args = { os.getenv('HOME') .. '/Projects/vscode-node-debug2/out/src/nodeDebug.js', '--esm' }
}

M.configurations = {}

M.configurations.typescript = {
    {
        type = 'typescript',
        request = 'launch',
        name = 'Launch program (node2 with ts-node)',
        cwd = vim.fn.getcwd(),
        runtimeArgs = { '-r', 'ts-node/register' },
        args = { '--inspect', '${file}' },
        sourceMaps = true,
        skipFiles = { '<node_internal>/**', 'node_modules/**' },
    },
    {
        type = 'typescript',
        request = 'attach',
        name = 'Attatch to program (node2 with ts-node)',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        skipFiles = { '<node_internal>/**' },
        port = 9229,
    },
    {
        type = 'typescript',
        request = 'launch',
        name = 'Launch test (node2 with ts-node)',
        cwd = vim.fn.getcwd(),
        runtimeArgs = { '--inspect-brk', '${workspaceFolder}/node_modules/.bin/jest' },
        runtimeExecutable = 'node',
        args = { '${file}', '--runInBand', '--coverage', 'false' },
        sourceMaps = true,
        port = 9229,
        skipFiles = { '<node_internal>/**', 'node_modules/**' },
    },
}

return M
