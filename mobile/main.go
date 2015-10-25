package syncthing

import "github.com/syncthing/syncthing/mobile/cmd"

func SetConfDir(dir string) {
	cmd.ConfDir = dir
}

func SetGuiAddress(address string) {
	cmd.GuiAddress = address
}

func SetGuiAPIKey(key string) {
	cmd.GuiAPIKey = key
}

func SetGuiAssets(dir string) {
	cmd.GuiAssets = dir
}

func SetLogFile(path string) {
	cmd.LogFile = path
}

func SetLogFlags(flags int) {
	cmd.LogFlags = flags
}

func SetAuditEnabled(enabled bool) {
	cmd.AuditEnabled = enabled
}

func SetVerbose(enabled bool) {
	cmd.Verbose = enabled
}

func SetPaused(enabled bool) {
	cmd.Paused = enabled
}

func Run() {
	go cmd.Run()
}
