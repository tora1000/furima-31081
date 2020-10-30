## users テーブル


| Column             | Type        | Options      |
| ------------------ | ----------- | ------------ |
| nickname           | string      | null: false  |
| email              | string      | null: false  |
| encrypted_password | string      | null: false  | 
| first_name         | string      | null: false  |
| last_name          | string      | null: false  |
| first_name_kana    | string      | null: false  |
| last_name_kana     | string      | null: false  | 
| birthday           | date        | null: false  |

### Association

- has_many :products
- has_many :comments
- has_many :user_products



## products テーブル


| Column             | Type        | Options                       |
| ------------------ | ----------- | ----------------------------- |
| name               | string      | null: false                   |
| description        | text        | null: false                   |
| category_id        | integer     | null: false                   |
| status_id          | integer     | null: false                   |
| shipping_id        | integer     | null: false                   | 
| prefecture_id      | integer     | null: false                   |
| shipping_day_id    | integer     | null: false                   | 
| price              | integer     | null: false                   |
| user               | references  | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :user_products

## comments テーブル

| Column     | Type        | Options                       |
| ---------- | ----------- | ----------------------------- |
| text       | text        | null: false                   |
| user       | references  | null: false, foreign_key:true |
| prototype  | references  | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :product

## user_products テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :shipping_address

## shipping_address テーブル

| Column            | Type        | Options                       |
| ----------------- | ----------- | ----------------------------- |
| post_number       | string      | null: false                   |
| prefecture_id     | integer     | null: false                   |
| city              | string      | null: false                   |
| address           | string      | null: false                   |
| address_building  | string      |                               | 
| phone_number      | string      | null: false                   |
| user_product      | references  | null: false, foreign_key:true |

- has_one :user_product
