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

- has_many :products, through: users_products
- has_many :comments
- has_one  :shipping_address



## products テーブル


| Column          | Type        | Options                       |
| --------------- | ----------- | ----------------------------- |
| name            | string      | null: false                   |
| description     | text        | null: false                   |
| category        | integer     | null: false                   |
| status          | integer     | null: false                   |
| shipping        | integer     | null: false                   | 
| shipment_source | integer     | null: false                   |
| shipping_day    | integer     | null: false                   | 
| price           | integer     | null: false                   |
| user            | references  | null: false, foreign_key:true |

### Association

- belongs_to :user, through: users_products
- has_many   :comments


## comments テーブル

| Column     | Type        | Options                       |
| ---------- | ----------- | ----------------------------- |
| text       | text        | null: false                   |
| user       | references  | null: false, foreign_key:true |
| prototype  | references  | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :product

## users_products テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| products   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## shipping_address テーブル

| Column           | Type        | Options                       |
| ---------------  | ----------- | ----------------------------- |
| post_number      | integer     | null: false                   |
| prefecture       | text        | null: false                   |
| city             | text        | null: false                   |
| address          | integer     | null: false                   |
| address_building | text        |                               | 
| phone_number     | integer     | null: false                   |
| user             | references  | null: false, foreign_key:true |

### Association

- has_one :user
