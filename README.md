## Wstęp

Aplikacja składa się ze strony internetowej zarządzanej pythonowym flaskiem, przygotowanej pod konteneryzację pod
Dockerem i gotowej do postawienia na App Service Azure.

## Wykorzystane zasoby

- Docker
- Azure CLI 
- subskrypcja na portalu Azure

## Instrukcja

  1. Logujemy się na nasze konto Azure i tworzymy grupę zasobów:

```bash
  az login
_________________________________________________________________

  az group create -l eastus --name uipddawc79114
```

  2. Możemy wrzucić naszą aplikację do kontenera samego Dockera. Logujemy się do niego konsolą, tworzymy obraz z pomocą
Dockerfile i uruchamiamy go.
```bash
docker login
_________________________________________________________________

docker image build -t miseiyume/uipddawc79114 .
_________________________________________________________________

docker container run --detach --publish 8081:5000 --name uipddawc79114 miseiyume/uipddawc79114
```
W tym momencie nasza strona powinna się już poprawnie wyświetlać pod "http://localhost:8081".

  3. Następnie tworzymy plan do naszego App Service'u, a następnie samą aplikację mającą zawierać nasz kontener.
```bash
az appservice plan create \
--name uipddawc79114plan \
--resource-group uipddawc79114 \
--location eastus \ 
--is-linux
_________________________________________________________________

az webapp create \
--name uipddawc79114 \
--plan uipddawc79114plan \
--resource-group uipddawc79114 \
--deployment-container-image-name miseiyume/uipddawc79114:latest
```
URL pod którym możemy od teraz korzystać z naszej strony:
https://uipddawc79114.azurewebsites.net
