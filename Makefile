all: dist/index.html dist/styles.css

dist/index.html: index.html
	mkdir -p dist && cp index.html dist/index.html

dist/styles.css: styles/styles.src.css
	yarn tailwindcss build styles/styles.src.css -o dist/styles.css

install: package.json
	yarn install

build: Dockerfile
	docker build .

clean:
	rm -rf dist
