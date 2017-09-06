# users table

|Column|Type|Options|
|---|---|---|
|user_id|integer|foreign_key: true|
|user_name|integer|null :false|
|e-mail|text|null :false|

has_many: messages
has_many: groups, :through => : groups_id
has_many: users


## groups table

|Column|Type|Options|
|---|---|---|
|group_id|integer|foreign_key: true|
|group_name|integer|null :false|

has_many: users, :through => :users_id
has_many: groups, :through => : groups_id


### group table (relative)

|Column|Type|Options|
|---|---|---|
|user_id|integer|
|group_id|integer|

belongs_to: user
belongs_to: group


#### messages table

|Column|Type|Options|
|---|---|---|
|body|text|
|image|string|
|created_date|timestamp|

belongs_to: user
belongs_to: group
