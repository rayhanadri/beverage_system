package repository

import (
	"beverage_system/entity"
)

type UserRepository interface {
	FindAll() ([]entity.User, error)
	FindByID(ID int) (entity.User, error)
}

type UserRepositoryImpl struct {
	users []entity.User
}
