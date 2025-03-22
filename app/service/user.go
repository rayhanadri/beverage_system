package service

import (
	"beverage_system/entity"
	"beverage_system/handler"
	"beverage_system/repository"
)

type UserService struct {
	userRepository repository.UserRepository
}

func NewUserService(userRepository repository.UserRepository) UserService {
	return UserService{userRepository}
}

func (service *UserService) GetUsers() ([]entity.User, error) {
	user, err := handler.GetUsers()
	if err != nil {
		return user, err
	}

	return user, nil
}

func (service *UserService) GetUserByID(ID int) (entity.User, error) {
	// user, err := service.userRepository.FindByID(ID)
	user, err := service.userRepository.FindByID(ID)
	if err != nil {
		return user, err
	}

	return user, nil
}
