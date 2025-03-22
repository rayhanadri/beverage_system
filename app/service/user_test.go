package service

import (
	"beverage_system/entity"
	"beverage_system/repository"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"

	"errors"
)

var userRepo = &repository.UserRepositoryMock{Mock: mock.Mock{}}
var userService = NewUserService(userRepo)

func TestProductService_GetProductByID(t *testing.T) {
	user := entity.User{
		ID:   1,
		Name: "Laptop",
		Age:  25,
	}

	userRepo.On("FindByID", 1).Return(user, nil)

	result, err := userService.GetUserByID(1)
	assert.Nil(t, err)
	assert.Equal(t, user, result)
}

func TestProductService_GetProductByIDNotFound(t *testing.T) {
	user := entity.User{}

	userRepo.On("FindByID", 1).Return(user, errors.New("Product not found"))

	result, err := userService.GetUserByID(1)
	assert.NotNil(t, err)
	assert.Equal(t, user, result)
}

func TestProductService_GetUsers(t *testing.T) {
	user := entity.User{}

	userRepo.On("FindByID", 1).Return(user, errors.New("Product not found"))

	result, err := userService.GetUserByID(1)
	assert.NotNil(t, err)
	assert.Equal(t, user, result)
}
