build_and_run:
	docker-compose up --build

shell:
	docker-compose exec app /bin/bash

shutdown:
	docker-compose down