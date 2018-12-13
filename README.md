# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|postal_cord|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|building|string||
|phone|integer|null: false|
|profile|text||
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|avatar|text|null: false|

### Association
- has_one :credit_card
- has_many :items
- has_many :likes
- has_many :comments
- has_many :sns_credential

## credit_cardテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false|
|security_code|integer|null: false|
|limit_month|integer|null: false|
|limit_year|integer|null: false|

### Association
- belongs_to :users

## large_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|

### Association
- has_many :medium_categorie
- has_many :brands
- has_many :items

## medium_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|large_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :large_category
- has_many :small_categories
- has_many :items

## small_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|medium_category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :medium_category
- has_many :items

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|unique: true|

### Association
- has_many :large_categories
- has_many :items

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|large_category_id|integer|null: false, foreign_key: true|
|medium_category_id|integer|null: false, foreign_key: true|
|small_category_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
|condition|string|null: false|
|delivery_fee|string|null: false|
|shipping_method|string|null: false|
|delivery_dates|string|null: false|
|prefecture|string|null: false|
|delivery_dates|string|null: false|
|price|integer|null: false|
|description|text|null:false|

### Association
- belongs_to :user
- belongs_to :large_category
- belongs_to :medium_category
- belongs_to :small_category
- belongs_to :brand
- has_one :size
- has_many :item_images
- has_many :likes
- has_many :comments

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|main_image|text|null: false|
|sub_imgae_1|text||
|sub_image_2|text||
|sub_image_3|text||
|item_id|integer|null: false, foreign_key: true|

### Association
belongs_to :item

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## sns_credentialテーブル
|Column|Type|Options|
|------|----|-------|
|uid|integer||
|provider|integer||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
