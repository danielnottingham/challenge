![example workflow](https://github.com/danielnottingham/challenge/actions/workflows/ci.yml/badge.svg)

## Requerimentos:
- Ruby 3.3.6 (apenas para desenvolvimento local, o Docker cuida das versões)
- Docker
- Docker-Compose

## Iniciando:
1. Clone o repositório para o seu ambiente local.
2. Navegue até o diretório raiz do aplicativo.
3. Crie um arquivo .env baseado no .env.example
```
# ambiente de desenvolvimento
cp .env.example .env
```
4. Execute o comando para subir os serviços:
```
docker compose up -d --build
```

## Rodando os Testes
```
docker compose exec -e RAILS_ENV=test app bundle exec rspec
```
