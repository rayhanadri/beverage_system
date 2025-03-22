package repository

import (
	"beverage_system/entity"

	"github.com/stretchr/testify/mock"
)

type UserRepositoryMock struct {
	mock.Mock
}

func (r *UserRepositoryMock) FindAll() ([]entity.User, error) {
	args := r.Called()
	return args.Get(0).([]entity.User), args.Error(1)
}

func (r *UserRepositoryMock) FindByID(ID int) (entity.User, error) {
	args := r.Called(ID)
	return args.Get(0).(entity.User), args.Error(1)
}
