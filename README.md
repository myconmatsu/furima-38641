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
| item_image        | string       | null: false                  |
| item_name         | string     	 | null: false                  |
| content           | text     		 | null: false                  |
| category          | integer 		 | null: false                  |
| item_condition    | integer      | null: false                  |
| delivery_charge   | integer      | null: false                  |
| delivery_area	    | integer      | null: false                  |
| shipment_days	    | integer      | null: false                  |
| item_price   		  | string       | null: false                  |
| user_id			      | references   | null: false, foreign_key: true|

### Association

- belongs_to : user
- has_one : order
- has_one : buyer

## buyers テーブル

| Column      			 | Type     	| Options     |
| ------------ 		   | ---------- |----------   |
| first_name         | string 		| null: false |
| family_name        | string 		| null: false |
| first_name_kana    | string 		| null: false |
| family_name_kana   | string 		| null: false |
| post_code          | string 		| null: false |
| prefecture         | string 		| null: false |
| city			         | string 		| null: false |
| house_number	     | string 		| null: false |
| building_name		   | string 		|             |
| phone_number       | string 		| null: false |

### Association

- has_one : item
- has_one : order

## orders テーブル

| Column      	| Type     	 | Options   |
| ------------ 	| ---------- |---------- |
| user_id		    | references | null: false, foreign_key: true|
| buyer_id	   	| references | null: false, foreign_key: true|
| item_id       | references | null: false, foreign_key: true|

### Association
- has_one : item
- has_one : buyer
