## users テーブル

| Column     | Type        | Options      |
| ---------- | ----------- | ------------ |
| nickname   | string      | null: false  |
| email      | string      | null: false  |
| password   | string      | null: false  | 
| name       | string      | null: false  |
| name_kana  | string      | null: false  | 
| birthday   | date        | null: false  |

### Association

- has_many :products
- has_many :comments


## products テーブル

| Column          | Type        | Options      |
| --------------- | ----------- | ------------ |
| name            | string      | null: false  |
| description     | text        | null: false  |
| category        | string      | null: false  |
| status          | string      | null: false  |
| shipping        | string      | null: false  | 
| shipment_source | string      | null: false  |
| shipping_day    | date        | null: false  | 
| price           | integer     | null: false  |
| user_id         | references  |              |

### Association

- belongs_to :users
- has_many :comments


## comments テーブル

| Column     | Type        | Options      |
| ---------- | ----------- | ------------ |
| text       | text        | null: false  |
| user       | references  |              |
| prototype  | references  |              |

### Association

- belongs_to :users
- belongs_to :products


