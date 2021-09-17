# README
# テーブル設計

## users テーブル

| Column                 | Type       | Options                          |
| ---------------------- | ---------- | ------------------------------   |
| nickname               | string     | null:   false                    |
| email                  | string     | null:   false, unique: true      |
| encrypted_password     | string     | null:   false                    |
| birth_date             | date       | null:   false                    |
| last_name              | string     | null:   false                    |
| first_name             | string     | null:   false                    |
| last_name_kana         | string     | null:   false                    |
| first_name_kana        | string     | null:   false                    |

### Association

- has_many :items
- has_many :purchases

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
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery_address

## delivery_addresses テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code            | string     | null: false                    |
| prefecture_id          | integer    | null: false                    |
| city                   | string     | null: false                    |
| building_name          | string     |                                |
| address                | string     | null: false                    |
| phone_number           | string     | null: false                    |
| purchase               | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase