# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birthday              | integer| null: false |

### Association
- has_many :sells
- belongs_to :product

## sells テーブル (出品)

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| product_name          | text   | null: false |
| product_description   | text   | null: false |
| category              | integer| null: false |
| product_condition     | integer| null: false |
| delivery_fee          | integer| null: false |
| shipping_area         | integer| null: false |
| day                   | integer| null: false |
| price                 | integer| null: false |
| user                  | references| null: false, foreign_key: tru |

### Association
- belongs_to :user
- belongs_to :product

## products テーブル (購入)

| Column                | Type      | Options     |
| --------              | ------    | ----------- |
| user                  | references| null: false, foreign_key: tru |
| sell                  | references| null: false, foreign_key: tru |
| postal_code           | integer   | null: false |
| prefectures           | integer   | null: false |
| municipality          | string    | null: false |
| address               | string    | null: false |
| building_name         | integer   | null: false |
| phone_number          | integer   | null: false |

### Association
belongs_to :user
belongs_to :sell

