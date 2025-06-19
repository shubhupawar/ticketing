# 🎫 Laravel Ticketing System

A simple ticketing system built with **Laravel**, featuring:

- API with Laravel Sanctum authentication
- Blade-based frontend using Bootstrap
- File attachments for tickets and replies
- Role-based data access and validation

---

## 🚀 Features

### ✅ API (Laravel Sanctum)

- **User registration & login** via API
- **Token-based authentication**
- Create, view, and list tickets
- Add replies to tickets
- Upload attachments (jpg, png, pdf, docx — max 2MB)

### 🖥️ Web Frontend (Blade + Bootstrap)

- Authentication (register, login, logout)
- Dashboard listing user tickets
- Create ticket with file upload
- View ticket details, attachments, and replies
- Submit replies with optional attachments

## Setup

1. Clone the repo

```bash
git clone https://github.com/yourusername/ticketing.git
cd ticketing
```

2. Install dependencies

```bash
composer install
```
3. Configure .env
```bash
cp .env.example .env
php artisan key:generate
```
4. Setup your database in .env

5. Run
```bash
php artisan migrate --seed
```

6. Stoarge link
```bash
php artisan storage:link
```

7. Serve the app 
```bash
php artisan serve
```

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
 
### 🙌 Author

Developed by Devendra Barange
🔗 GitHub: https://github.com/shubhupawar/ticketing.git