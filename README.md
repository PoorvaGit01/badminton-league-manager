# 🏸 Badminton League Manager

A Ruby on Rails application to manage badminton players, record match results, and display a leaderboard based on wins and losses.

---

## 🚀 Features

* Add and manage players
* Record matches between players
* Track:

  * Wins
  * Losses
* Leaderboard ranking system
* Custom validations to ensure match integrity
* Clean UI using Bootstrap

---

## 🛠 Tech Stack

* **Ruby** (latest stable version)
* **Rails** (~> 8.1.1)
* **SQLite3**
* **Bootstrap**

---

## 📦 Prerequisites

* Ruby -> 3.4.5

* Rails (~> 8.1.1)

---

## ⚙️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/PoorvaGit01/badminton-league-manager.git
cd badminton-league-manager
```

### 2. Install dependencies

```bash
bundle install
```

### 3. Setup database

```bash
rails db:reset
```

---

## 🌱 Seed Data

The app includes:

* Sample players
* Random match results

Run manually:

```bash
rails db:seed
```

---

## ▶️ Running the Application

```bash
bin/dev
```

Visit:

```
http://localhost:3000
```

---

## 🧪 Running Tests

```bash
bundle exec rspec
```

---

## 🧠 Key Concepts Used

### ActiveRecord Associations

* `belongs_to :winner`
* `belongs_to :loser`
* `has_many :matches_won`
* `has_many :matches_lost`

### Custom Validations

* Ensures winner and loser are present
* Prevents same player being both winner and loser

### Callback Logic

* Uses `after_create` to update:

  * `matches_won_count`
  * `matches_lost_count`

---

## 📊 Leaderboard Logic

Players are ranked based on total wins:

```ruby
Player.order(matches_won_count: :desc)
```

---