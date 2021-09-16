# README
# テーブル設計

## users テーブル

| Column                 | Type       | Options                          |
| ---------------------- | ---------- | ------------------------------   |
| id                     | integer    | null:   false                    |
| nickname               | string     | null:   false                    |
| email                  | string     | unique:  true                    |
| encrypted_password     | string     | null:   false                    |
| birth_date             | date       | null:   false                    |
| last_name              | string     | null:   false                    |
| first_name             | string     | null:   false                    |
| last_name_kana         | string     | null:   false                    |
| first_name_kana        | string     | null:   false                    |

### Association

- has_many :items
- has_many :purchases
- has_many :user_delivery_addresses
- has_many :delivery_addresses, through: :user_delivery_addresses

## user_delivery_addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| delivery_address     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :delivery_address

## delivery_addresses テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code_id         | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| city                   | string     | null: false                    |
| building_name          | string     | null: false                    |
| address                | string     | null: false                    |
| phone_number           | integer    | null: false                    |
| item                   | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- has_many :user_delivery_addresses
- has_many :users, through: :user_delivery_addresses

## items テーブル

| Column                 | Type       | Options                        |
| ------------------     | -----------| ------------------------------ |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| price                  | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :delivery_addresses
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| buyer              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user