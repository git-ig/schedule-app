# Reverse Proxy Role

This role setups & configures nginx as reverse proxy on bastion host.

## Functionality

- Проксирование frontend запросов на `10.0.2.31:80`
- Проксирование API запросов на `10.0.2.33:8080`
- Healthcheck endpoint на `/health`

## Переменные

- `frontend_private_ip` - IP адрес frontend сервера
- `backend_private_ip` - IP адрес backend сервера

## Использование
