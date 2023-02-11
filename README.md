# テーブル設計

## users テーブル
  
| Column                  | Type   | Options                    |
| ------------------      | ------ | -------------------------- |
| nickname                | string | null: false                |
| email                   | string | null: false , unique: true |
| encrypted_password      | string | null: false                |
| first_name              | string | null: false                |
| family_name             | string | null: false                |
| first_name_kana         | string | null: false                |
| family_name_kana        | string | null: false                |
| birth_day               | date   | null: false                |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           	| Type         | Options                      |
| ----------       	| ------------ | ----------------------       |
| item_name         | string     	 | null: false                  |
| content           | text     		 | null: false                  |
| category_id       | integer 		 | null: false                  |
| condition_id      | integer      | null: false                  |
| prefecture_id     | integer      | null: false                  |
| delivery_area_id	   | integer      | null: false                  |
| shipment_days_id	   | integer      | null: false                  |
| item_price   		  | string       | null: false                  |
| user			      | references   | null: false, foreign_key: true|

### Association

- belongs_to : user
- has_one : order

## buyers テーブル

| Column      			 | Type     	| Options     |
| ------------ 		   | ---------- |----------   |
| post_code          | string 		| null: false |
| prefecture_id      | integer      | null: false                  |
| city			         | string 		| null: false |
| house_number	     | string 		| null: false |
| building_name		   | string 		|             |
| phone_number       | string 		| null: false |
| order	             | references | null: false, foreign_key: true|


### Association

- belongs_to : order

## orders テーブル

| Column      	| Type     	 | Options   |
| ------------ 	| ---------- |---------- |
| user	    | references | null: false, foreign_key: true|
| buyer	   	| references | null: false, foreign_key: true|
| item      | references | null: false, foreign_key: true|

### Association
- belongs_to : user
- belongs_to : item
- has_one : buyer
