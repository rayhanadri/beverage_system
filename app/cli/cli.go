package cli

import (
	"beverage_system/entity"
	"beverage_system/handler"
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func Run() {
	reader := bufio.NewReader(os.Stdin)
	for {
		fmt.Println("1. Add User")
		fmt.Println("2. Get Users")
		fmt.Println("3. Update User")
		fmt.Println("4. Exit")
		fmt.Print("Choose menu: ")
		menu, _ := reader.ReadString('\n')
		menu = strings.TrimSpace(menu)

		switch menu {
		case "1":
			fmt.Print("Name: ")
			name, _ := reader.ReadString('\n')
			// name = name[:len(name)-1]
			name = strings.TrimSpace(name)
			fmt.Print("Age: ")
			age, _ := reader.ReadString('\n')
			// age = age[:len(age)-1]
			age = strings.TrimSpace(age)
			intAge, err := strconv.Atoi(age)
			if err != nil {
				fmt.Println(err)
			}
			handler.AddUser(entity.User{Name: name, Age: intAge})
		case "2":
			users, _ := handler.GetUsers()
			// users, _ := service.UserService
			for _, user := range users {
				fmt.Println(user)
			}
		case "3":
			fmt.Print("ID: ")
			id, _ := reader.ReadString('\n')
			// id = id[:len(id)-1]
			id = strings.TrimSpace(id)
			intID, err := strconv.Atoi(id)
			if err != nil {
				fmt.Println(err)
			}
			fmt.Print("Name: ")
			name, _ := reader.ReadString('\n')
			// name = name[:len(name)-1]
			name = strings.TrimSpace(name)
			handler.UpdateUser(entity.User{ID: intID, Name: name})
		case "4":
			fmt.Println("Bye!")
			os.Exit(0)
		default:
			fmt.Println("Invalid menu")
		}
	}
}
