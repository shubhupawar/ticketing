# Laravel Ticketing System

A simple ticketing system API built with Laravel and Sanctum.

## Features

- User registration and login (API token via Sanctum)
- Create support tickets with optional attachments
- Reply to own tickets with optional attachments
- File uploads: jpg, png, pdf, docx (max 2MB)
- Only ticket owners can view/reply

## Setup

1. Clone the repo  
2. Run `composer install`  
3. Run `php artisan migrate --seed`  
4. Run `php artisan storage:link`  
5. Start server: `php artisan serve`  

## API Endpoints

- `POST /api/register`
- `POST /api/login`
- `POST /api/tickets`
- `GET /api/tickets`
- `GET /api/tickets/{id}`
- `POST /api/tickets/{id}/reply`

## Authentication

All ticket routes require `Bearer Token` in headers.

## File Uploads

Stored in `storage/app/public/uploads`. Use `php artisan storage:link` to expose them.

## License

MIT
