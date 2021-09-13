# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birth_date         | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |

### Association

- has_many :items
- has_many :item_details
- has-one :purchases

## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| token              | string | null: false |
| postal_code        | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| phone_number       | string | null: false |

### Association

- has_one :users

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| price              | string     | null: false                    |
| sales_status       | string     | null: false                    |
| item_detail        | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :item_details

## item_details テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| category            | string | null: false |
| shipping_fee_status | string | null: false |
| scheduled_delivery  | string | null: false |

### Association

- belongs_to :users