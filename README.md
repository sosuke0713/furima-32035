# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| name         | string | null: false |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| encrypted_password| string | null: false |
| birth        | date | null: false |

### Association
- has_many :items

## items テーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| title     | string | null: false |
| image     | ActiveStorage  |
| price     | string | null: false |
| owner     | string | null: false , foreign_key:true|
| category  | string | null: false |
| status    | integer | null: false |
| Deliveryfee| integer | null: false |
| region    | integer | null: false |
|shippingdate| integer | null: false |
| comments  | text   | null: false |

### Association
- belong_to :user
- has_one :buyer


## buyers テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false, foreign_key:true |
| address| reference  | null: false, foreign_key:true |


### Association
- belong_to :item
- has_one : address

## address テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postnum| string     | null: false|
| state  | integer     | null: false|
| city   | string     | null: false|
|housenum| string     |            |
|building| string     | null: false|
|telenum | string     | null: false|

### Association
- belong_to :buyer