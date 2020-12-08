# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| name         | string | null: false |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| password(con)| string | null: false |
| birth        | string | null: false |

### Association
- has_many :itemes

## items テーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| title     | string | null: false |
| image     | ActiveStorage  |
| price     | string | null: false |
| owner     | string | null: false |
| category  | string | null: false |
| status    | string | null: false |
| Deliveryfee| string | null: false |
| region    | string | null: false |
|shippingdate| string | null: false |
| comments  | text   | null: false |

### Association
- belong_to :users
- has_one :buyers


## buyers テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false|
| address| reference  | foreign_key:true |


### Association
- belong_to :items
- has_one : address

## address テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postnum| string     | null: false|
| state  | string     | null: false|
| city   | string     | null: false|
|housenum| string     | null: false|
|building| string     | null: false|
|telenum | string     | null: false|

### Association
- belong_to :buyers