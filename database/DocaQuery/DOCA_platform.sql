CREATE TABLE [users] (
  [user_id] integer IDENTITY(1,1) PRIMARY KEY,
  [username] varchar(50) NOT NULL,
  [password] varchar(50) NOT NULL,
  [Gender] nchar(10) NOT NULL,
  [email] varchar(100) NOT NULL,
  [mobile_num] nvarchar(10) NOT NULL,
  [status] bit NOT NULL,
  [role_id] bit NOT NULL,
  [avatar] varchar(Max) NOT NULL
)
GO

CREATE TABLE [post] (
  [post_id] integer IDENTITY(1,1) PRIMARY KEY,
  [user_id] integer NOT NULL,
  [post_content] nvarchar(Max) NOT NULL,
  [post_image] nvarchar(Max),
  [isPublic] bit NOT NULL,
  [timePosted] datetime NOT NULL,
  [status] nvarchar(10) NOT NULL,
  [reason] nvarchar(100)
)
GO

CREATE TABLE [categoryLinkpost] (
  [post_id] integer NOT NULL,
  [category_id] integer NOT NULL
)
GO

CREATE TABLE [category] (
  [category_id] integer PRIMARY KEY,
  [category_name] nvarchar(50) NOT NULL
)
GO

CREATE TABLE [comment] (
  [comment_id] integer IDENTITY(1,1) PRIMARY KEY,
  [user_id] integer NOT NULL,
  [post_id] integer NOT NULL,
  [commentDes] nvarchar(Max) NOT NULL,
  [status] bit
)
GO

CREATE TABLE [like] (
  [like_id] integer IDENTITY(1,1) PRIMARY KEY,
  [post_id] integer NOT NULL,
  [user_id] integer NOT NULL
)
GO

CREATE TABLE [savePost] (
  [post_id] integer NOT NULL,
  [user_id] integer NOT NULL
)
GO

CREATE TABLE [product] (
  [product_id] integer IDENTITY(1,1) PRIMARY KEY,
  [user_id] integer NOT NULL,
  [category_id] integer NOT NULL,
  [title] nvarchar(150) NOT NULL,
  [description] nvarchar(Max) NOT NULL,
  [product_image] nvarchar(Max) NOT NULL,
  [is_free] bit NOT NULL,
  [price] float NOT NULL,
  [address] nvarchar(200) NOT NULL,
  [timePosted] datetime NOT NULL,
  [isPublic] bit NOT NULL,
  [status] nvarchar(10) NOT NULL,
  [reason] nvarchar(100)
)
GO

CREATE TABLE [saveProduct] (
  [user_id] integer NOT NULL,
  [product_id] integer NOT NULL
)
GO

CREATE TABLE [notification] (
  [notification_id] integer IDENTITY(1,1) PRIMARY KEY,
  [user_id] integer NOT NULL,
  [notification_value] nvarchar(Max) NOT NULL
)
GO

CREATE TABLE [conversation] (
  [conversation_id] integer IDENTITY(1,1) PRIMARY KEY,
  [product_id] integer NOT NULL,
  [buyer_id] integer NOT NULL,
  [seller_id] integer NOT NULL
)
GO

CREATE TABLE [messages] (
  [conversation_id] integer NOT NULL,
  [buyer_id] integer NOT NULL,
  [seller_id] integer NOT NULL,
  [messages_content] nvarchar(Max) NOT NULL,
  [messages_time] datetime NOT NULL
)
GO

ALTER TABLE [notification] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [post] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [comment] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [comment] ADD FOREIGN KEY ([post_id]) REFERENCES [post] ([post_id])
GO

ALTER TABLE [like] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [like] ADD FOREIGN KEY ([post_id]) REFERENCES [post] ([post_id])
GO

ALTER TABLE [savePost] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [savePost] ADD FOREIGN KEY ([post_id]) REFERENCES [post] ([post_id])
GO

ALTER TABLE [categoryLinkpost] ADD FOREIGN KEY ([post_id]) REFERENCES [post] ([post_id])
GO

ALTER TABLE [categoryLinkpost] ADD FOREIGN KEY ([category_id]) REFERENCES [category] ([category_id])
GO

ALTER TABLE [product] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [saveProduct] ADD FOREIGN KEY ([user_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [saveProduct] ADD FOREIGN KEY ([product_id]) REFERENCES [product] ([product_id])
GO

ALTER TABLE [product] ADD FOREIGN KEY ([category_id]) REFERENCES [category] ([category_id])
GO

ALTER TABLE [conversation] ADD FOREIGN KEY ([product_id]) REFERENCES [product] ([product_id])
GO

ALTER TABLE [conversation] ADD FOREIGN KEY ([buyer_id]) REFERENCES [users] ([user_id])
GO

ALTER TABLE [messages] ADD FOREIGN KEY ([conversation_id]) REFERENCES [conversation] ([conversation_id])
GO
