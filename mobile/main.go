package syncthing

import "github.com/syncthing/syncthing/mobile/cmd"

func Run() {
	go cmd.Run()
}

func Shutdown() {
	go cmd.Shutdown()
}

func Restart() {
	go cmd.Restart()
}
