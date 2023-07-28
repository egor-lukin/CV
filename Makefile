run:
	docker compose up

build:
	docker compose run app bash -c "pandoc index.md -o cv.pdf"
