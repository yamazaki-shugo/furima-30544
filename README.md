# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name_zen     | string | null: false |
| last_name_zen      | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Column          | Type      |  Options                 |
| --------------- | --------  | ------------------------ |
| name            | string    | null: false              |
| description     | text      | null: false              |
| category_id     | integer   | null: false, Active Hash |
| item_status_id  | integer   | null: false, Active Hash |
| burden_type_id  | integer   | null: false, Active Hash |
| shipping_area_id| integer   | null: false, Active Hash |
| days_to_ship_id | integer   | null: false, Active Hash |
| price           | integer   | null: false              |   
| user            | references| foreign_key: true        |

### Association

- belongs_to :user
- has_one :purchaser

## purchaser テーブル

| Column          | Type       |  Options                 |
| --------------- | ---------  | ------------------------ |
| user            | references | foreign_key: true        |
| item            | references | foreign_key: true        |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping-address

## shipping-addresses テーブル

| Column            | Type       |  Options                 |
| ----------------- | ---------  | ------------------------ |
| postal_code       | string     | null: false              |
| prefectures       | integer    | null: false, Active Hash |
| municipality      | string     | null: false              |
| address           | string     | null: false              |
| building_name     | string     |                          |
| phone_number      | string     | null: false              |
| purchaser         | references | foreign_key: true        |

### Association

- belongs_to :purchaser
