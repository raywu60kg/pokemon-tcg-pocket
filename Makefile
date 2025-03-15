new-migration-%: 
	migrate create -ext sql -dir internal/db/migrations -seq $*  