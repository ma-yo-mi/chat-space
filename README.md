# users table

|Column|Type|Options|Index|
|---|---|---|---|
|name|integer|null :false|unique: true|
|e-mail|text|null :false|

has_many: messages
has_many: group_members
has_many: groups, through: groups



## groups table

|Column|Type|Options|Index|
|---|---|---|---|
|name|integer|null :false|unique: true|

has_many: messages
has_many: users, through: :group_members
has_many: group_members


### group_members table

|Column|Type|Options|Index|
|---|---|---|---|
|user_id|integer|null :false, foreign_key: true|unique: true|
|group_id|integer|null :false, foreign_key: true|unique: true|

belongs_to: user
belongs_to: group



#### messages table

|Column|Type|Options|Index|
|---|---|---|---|
|body|text|
|image|string|

belongs_to: user
belongs_to: group
