local cmd = vim.cmd

cmd('command FlutterRun CocCommand flutter.run')
cmd('command FlutterHotReload CocCommand flutter.dev.hotReload')
cmd('command FlutterHotRestart CocCommand flutter.dev.hotRestart')
