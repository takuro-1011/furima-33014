# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birthday              | integer| null: false |

### Association
- has_many :sells
- has_many :products

## sells テーブル (出品)

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| product_name          | string | null: false |
| product_description   | text   | null: false |
| category_id           | integer| null: false |
| product_condition_id  | integer| null: false |
| delivery_fee_id       | integer| null: false |
| shipping_area_id      | integer| null: false |
| day_id                | integer| null: false |
| price                 | integer| null: false |
| user                  | references| null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :product

## products テーブル (購入)

| Column                | Type      | Options     |
| --------              | ------    | ----------- |
| user                  | references| null: false, foreign_key: true |
| sell                  | references| null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :sell
has_one :shippingaddress

## shippingaddress

| Column                | Type   | Options     |
| --------              | ------ | ----------- |
| postal_code           | string    | null: false |
| shipping_area_id      | integer   | null: false |
| municipality          | string    | null: false |
| address               | string    | null: false |
| building_name         | string    |
| phone_number          | string    | null: false |
| product               | references|null: false, foreign_key: true|

### Association
belongs_to :product