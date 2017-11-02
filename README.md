# README

## messageテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|
|image|string|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false  add_index user, :name, unique: true|
|email|varchar(50)|:email, unique:true|
### Association
- has_many :messages
- has_many :groups, through: :user_groups
- has_many :user_groups

## groupテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false, unique: true|
### Association
- has_many :users, through: :user_groups
- has_many :messages
- has_many :user_groups

## 中間テーブル user_group

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false  foreign_key: true|
|group_id|references|null: false  foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user
