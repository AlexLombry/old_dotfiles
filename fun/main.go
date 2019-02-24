package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
)

var (
	email      = flag.String("email", "email", "user Email address")
	password = flag.String("password", "password", "user Password")
)

type MacOS []struct {
	Comment string `json:"comment"`
	Command string `json:"command"`
}

func main() {

	// macOs()
	// softWare()
	vim()


	//inFile, _ := os.Open("BrewFile")
	//defer inFile.Close()
	//
	//scanner := bufio.NewScanner(inFile)
	//scanner.Split(bufio.ScanLines)
	//
	//for scanner.Scan() {
	//
	//	// here we can access file with scanner.Text()
	//	fmt.Println(scanner.Text())
	//}
}



//ESC_SEQ="\x1b[
//COL_RESET=$ESC_SEQ"        \x1b[39;49;00m
//COL_RED=$ESC_SEQ"        \x1b[31;01m
//COL_GREEN=$ESC_SEQ"        \x1b[32;01m
//COL_YELLOW=$ESC_SEQ"        \x1b[33;01m
//COL_BLUE=$ESC_SEQ"        \x1b[34;01m
//COL_CYAN=$ESC_SEQ"        \x1b[36;01m


func macOs() {
	// Open our jsonFile
	jsonFile, err := os.Open("macos.json")
	// if we os.Open returns an error then handle it
	if err != nil {
		fmt.Println(err)
	}
	// defer the closing of our jsonFile so that we can parse it later on
	defer jsonFile.Close()
	byteValue, _ := ioutil.ReadAll(jsonFile)

	var result MacOS
	err = json.Unmarshal([]byte(byteValue), &result)
	if err != nil {
		panic(err)
	}

	fmt.Println("\x1b[31;01m------- \x1b[36;01m MacOS installation started ! \x1b[31;01m-------")
	for _, macos := range result {
		fmt.Println("\x1b[32;01m=======> \x1b[39;49;00m" + macos.Comment)
		cmd := exec.Command("bash", "-c", macos.Command).Run()
		if cmd != nil {
			fmt.Println(cmd)
		}
	}
	fmt.Println("\x1b[31;01m------- \x1b[36;01m MacOS installation terminated ! \x1b[31;01m-------")
}

func softWare() {
	// Open our jsonFile
	jsonFile, err := os.Open("software.json")
	// if we os.Open returns an error then handle it
	if err != nil {
		fmt.Println(err)
	}
	// defer the closing of our jsonFile so that we can parse it later on
	defer jsonFile.Close()
	byteValue, _ := ioutil.ReadAll(jsonFile)

	var result MacOS
	err = json.Unmarshal([]byte(byteValue), &result)
	if err != nil {
		panic(err)
	}

	fmt.Println("\x1b[31;01m------- \x1b[36;01m Software installation started ! \x1b[31;01m-------")
	for _, macos := range result {
		fmt.Println("\x1b[32;01m=======> \x1b[39;49;00m" + macos.Comment)
		cmd := exec.Command("bash", "-c", macos.Command).Run()
		if cmd != nil {
			fmt.Println(cmd)
		}
	}
	fmt.Println("\x1b[31;01m------- \x1b[36;01m Software installation terminated ! \x1b[31;01m-------")
}

func vim() {
	home := os.Getenv("HOME")
	_ = exec.Command("bash","-c", "rm -rf ~/.vim").Run()
	_ = exec.Command("bash","-c", "mkdir -p ~/.vim/{backups,swap,bundle,colors,autoload}").Run()
	_ = exec.Command("bash","-c", "ln -s " + home + "/vim/vimrc ~/.vimrc").Run()
	_ = exec.Command("bash","-c", "cp -R ~/dotfiles/vim/colors ~/.vim/").Run()
	_ = exec.Command("bash","-c", "brew install vim --env-std --override-system-vim --with-lua").Run()
	_ = exec.Command("bash","-c", "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim").Run()
	_ = exec.Command("bash","-c", "vim +PluginInstall +qall").Run()
}

func greenArrow(str string) {
	fmt.Println("\x1b[32;01m=======> \x1b[39;49;00m" + str)
}
