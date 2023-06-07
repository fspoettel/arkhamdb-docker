setup:
	git clone https://github.com/Kamalisk/arkhamdb
	git clone https://github.com/Kamalisk/arkhamdb-json-data

migrate:
	docker exec -it arkhamdb-docker-app-1 php bin/console doctrine:schema:create

import-cards:
	docker exec -it arkhamdb-docker-app-1 php bin/console app:import:std /data/ -n
