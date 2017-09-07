# users table

|Column|Type|Options|
|---|---|---|
|name|integer|null :false, index: true, unique: true|
|e-mail|text|null :false|

has_many: messages
has_many: groups_users
has_many: groups, through: groups_users



## groups table

|Column|Type|Options|
|---|---|---|
|name|integer|null :false, unique: true|

-has_many: messages
-has_many: users, through: :group_members
-has_many: groups_users


### groups_users table

|Column|Type|Options|
|---|---|---|
|user_id|integer|null :false, foreign_key: true|
|group_id|integer|null :false, foreign_key: true|

-belongs_to: user
-belongs_to: group



#### messages table

|Column|Type|Options|
|---|---|---|
|body|text|
|image|string|
|user_id|integer|null :false, foreign_key: true|
|group_id|integer|null :false, foreign_key: true|

-belongs_to: user
-belongs_to: group
