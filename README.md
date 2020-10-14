# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name_zen  | string | null: false |
| last_name_zen   | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_year      | date   | null: false |
| birth_month     | date   | null: false |
| birth_day       | date   | null: false |

### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Column          | Type      |  Options                 |
| --------------- | --------  | ------------------------ |
| image           |           | Active Storage           |
| name            | string    | null: false              |
| description     | text      | null: false              |
| category        |           | null: false, Active Hash |
| item_status     |           | null: false, Active Hash |
| burden_type     |           | null: false, Active Hash |
| shipping_area   |           | null: false, Active Hash |
| days_to_ship    |           | null: false, Active Hash |
| price           | integer   | null: false              |   
| user_id         | reference | foreign_key: true        |

### Association

- belongs_to :user
- has_one :purchaser

## purchaser テーブル

| Column          | Type      |  Options                 |
| --------------- | --------  | ------------------------ |
| user_id         | reference | foreign_key: true        |
| item_id         | reference | foreign_key: true        |

### Association

- belongs_to :user
- belongs_to :item
- has_one :card
- has_one :shipping-address

## cards テーブル

| Column            | Type      |  Options                 |
| ----------------- | --------  | ------------------------ |
| cord_number       | integer   | null: false              |
| expriration_month | integer   | null: false              |
| expriration_year  | integer   | null: false              |
| security_code     | integer   | null: false              |
| purchaser_id      | reference | foreign_key: true        |

### Association

- belongs_to :purchaser

## shipping-address テーブル

| Column            | Type      |  Options                 |
| ----------------- | --------  | ------------------------ |
| postal_code       | integer   | null: false              |
| prefectures       |           | null: false, Active Hash |
| municipality      | string    | null: false              |
| address           | string    | null: false              |
| building_name     | string    |                          |
| phone_number      | integer   | null: false              |
| purchaser_id      | reference | foreign_key: true        |

### Association

- belongs_to :purchaser
