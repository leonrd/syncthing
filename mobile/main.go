package syncthing

import "github.com/syncthing/syncthing/mobile/cmd"

func Run() {
	go cmd.Run()
}
