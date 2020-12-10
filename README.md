# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| familyname | string | null: false |
|family_hurigana| string | null: false|
| firstname  | string | null: false |
| first_hurigana|string| null: false |
| nickname     | string | null: false |
| email        | string | null: false ,unique: true|
| encrypted_password| string | null: false |
| birth        | date | null: false |

### Association
- has_many :items
- has_many :buyers

## items テーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| title     | string | null: false |
| price     | integer | null: false |
| user      | references | foreign_key:true|
| category_id  | integer | null: false |
| status_id    | integer | null: false |
| deliveryfee_id| integer | null: false |
| state_id    | integer | null: false |
|shippingdate_id| integer | null: false |
| comments  | text   | null: false |

### Association
- belong_to :user
- has_one :buyer


## buyers テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | foreign_key:true |
| item   | references | foreign_key:true |


### Association
- belong_to :item
- belong_to :user
- has_one : address

## address テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| postnum| string     | null: false|
| state_id | integer  | null: false|
| city   | string     | null: false|
|housenum| string     |            |
|building| string     | null: false|
|telenum | string     | null: false|

### Association
- belong_to :buyer