# Rails Store

A hands-on tutorial project following the [official Ruby on Rails guides](https://guides.rubyonrails.org/getting_started.html). This app is a simple e-commerce store with product listings, wishlists, and inventory notification subscriptions.

## What It Does

- Browse a product catalog with rich text descriptions and featured images
- Create and manage wishlists, adding or removing products
- Subscribe to email notifications when out-of-stock products become available
- User authentication: sign up, log in, password reset, and email confirmation
- Admin panel for managing products, users, wishlists, and subscribers

## Tech Stack

- **Rails 8.1** with SQLite3
- **Hotwire** (Turbo + Stimulus) for reactive UI without a heavy JavaScript framework
- **Active Storage** for product image uploads
- **Action Text** for rich text product descriptions
- **Solid Queue / Solid Cache / Solid Cable** — database-backed adapters for jobs, cache, and WebSockets
- **Kamal** for Docker-based deployment

## Getting Started

### Prerequisites

- Ruby 3.x
- Bundler

### Setup

```bash
git clone <repo-url>
cd store
bundle install
rails db:setup
rails server
```

Open `http://localhost:3000` in your browser.

### Running Tests

```bash
rails test
rails test:system
```

## Project Structure Highlights

| Path | Description |
|---|---|
| `app/models/` | User, Product, Wishlist, Subscriber, Session |
| `app/controllers/concerns/authentication.rb` | Cookie-based session auth |
| `app/controllers/concerns/authorization.rb` | Admin role enforcement |
| `app/controllers/store/` | Namespaced admin controllers |
| `app/mailers/` | Password reset, email confirmation, stock notifications |
| `config/routes.rb` | Main routes + `/store` admin namespace |
| `db/schema.rb` | Full database schema |

## Key Features Implemented

**Authentication**
Custom session-based auth using `has_secure_password` and a `sessions` table. Includes email confirmation on address changes and token-based password reset.

**Wishlists**
Users can create multiple named wishlists and add products to them. Duplicate entries are prevented at the database level.

**Stock Notifications**
Visitors can subscribe to a product by email. When inventory is updated, `ProductMailer#in_stock` is enqueued via Solid Queue to notify all subscribers.

**Admin Panel**
Available at `/store`. Restricted to users with `admin: true`. Provides full CRUD over products, users, wishlists, and subscribers.

## Learning Resources

- [Getting Started with Rails](https://guides.rubyonrails.org/getting_started.html)
- [Ruby on Rails Guides](https://guides.rubyonrails.org/)
- [Hotwire](https://hotwired.dev/)
