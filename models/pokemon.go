package models

type Pokemon struct {
	ID   uint   `json:"id" gorm:"primaryKey"`
	Name string `json:"name"`
	Type string `json:"type"`
}
