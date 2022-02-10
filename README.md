# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | unique:true, null: false |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| sex                | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :fridges
- has_many :user_fridges
- has_many :losses
- has_many :shoppings

## fridges テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |

### Association

- has_many :users
- has_many :user_fridges
- has_many :items

## user_fridges テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| fridge           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :fridge

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| category_id      | integer    | null: false                    |
| amount_id        | integer    | null: false                    |
| exp_date         | date       | null: false                    |
| fridge           | references | null: false, foreign_key: true |

### Association

- belongs_to :fridge
- has_many :losses
- has_many :shoppings
- has_many :shopping_items

## shoppings テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| shopping_date    | date       | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items
- has_many :shopping_items 

## shopping_items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| shopping      | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |

### Association

- belongs_to :shopping
- belongs_to :item

## losses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| loss_date     | date       | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item