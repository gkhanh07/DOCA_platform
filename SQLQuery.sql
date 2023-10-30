/****** Script for SelectTopNRows command from SSMS  ******/

  INSERT INTO [users] ([username], [password], [Gender], [email], [mobile_num], [status], [role_id], [avatar]) 
  values('Minh Luân', 'luan123', 'Male', 'luan@gmail.com', '0977327276', 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg' );
  INSERT INTO [users] ([username], [password], [Gender], [email], [mobile_num], [status], [role_id], [avatar]) 
  values('Phúc Thiên', 'thien123', 'Male', 'thien@gmail.com', '0937465182', 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/9/94/Post_Malone_2018.jpg' );
  INSERT INTO [users] ([username], [password], [Gender], [email], [mobile_num], [status], [role_id], [avatar]) 
  values('Gia Khánh', 'khanh123', 'Male', 'thien@gmail.com', '0912345678', 1, 1, 'https://nld.mediacdn.vn/291774122806476800/2023/8/13/3665085349062225008642913913849963549045693n-16918926488651354781164.jpg' );
  INSERT INTO [users] ([username], [password], [Gender], [email], [mobile_num], [status], [role_id], [avatar]) 
  values('Minh Nhật', 'nhat123', 'Male', 'nhat@gmail.com', '0925634187', 1, 1, 'https://timbaby.net/wp-content/uploads/2022/11/anh-trai-dep-5.jpg' );
  INSERT INTO [users] ([username], [password], [Gender], [email], [mobile_num], [status], [role_id], [avatar]) 
  values('Nhật Quang', 'quang123', 'Male', 'quang@gmail.com', '0976543210', 1, 1, 'https://i.pinimg.com/550x/00/09/fe/0009fed9e4f57680e85960c9a7378eea.jpg' );
  
  INSERT INTO [product] ([user_id], [category_id], [title], [description], [product_image], [is_free], [price], [address], [timePosted], [isPublic], [status], [reason])
VALUES (5, 1, N'Phụ kiện cho chó', N'Bát đựng thực ăn và nước', N'https://mcdn.coolmate.me/uploads/November2021/phu-kien-cho-meo-4_9.jpg', 0, 1500, N'123 Đường Nguyễn Du, Phường Quận 1, Thành phố Hồ Chí Minh, Việt Nam.', GETDATE(), 1, N'accepted', NULL);
  INSERT INTO [product] ([user_id], [category_id], [title], [description], [product_image], [is_free], [price], [address], [timePosted], [isPublic], [status], [reason])
VALUES (5, 1, N'Phụ kiện cho chó', N'Chuồng cho thú cưng', N'https://mcdn.coolmate.me/uploads/November2021/phu-kien-cho-meo-6.jpg', 0, 1500, N'123 Đường Nguyễn Du, Phường Quận 1, Thành phố Hồ Chí Minh, Việt Nam.', GETDATE(), 1, N'accepted', NULL);


insert into [post]([user_id],[post_content],[post_image],[isPublic],[timePosted],[status],[reason])
values(2,'Chó cute','https://i.pinimg.com/236x/03/2c/9d/032c9dca595bd47f6752a723e1032827.jpg',1,GETDATE(),'accepted',null);
insert into [post]([user_id],[post_content],[post_image],[isPublic],[timePosted],[status],[reason])
values(1,'Mèo dễ thương','https://i.pinimg.com/236x/f8/45/68/f8456800ac55a50acda33ea6b9267e54.jpg',1,GETDATE(),'accepted',null);
insert into [post]([user_id],[post_content],[post_image],[isPublic],[timePosted],[status],[reason])
values(1,'Vui vẻ','https://i.pinimg.com/236x/c6/81/99/c68199a5aed2d79f54193073c9ff9dc5.jpg',1,GETDATE(),'accepted',null);
insert into [post]([user_id],[post_content],[post_image],[isPublic],[timePosted],[status],[reason])
values(3,'Ngau','https://i.pinimg.com/236x/06/dc/9e/06dc9e95bc708811c90683d904dd2e58.jpg',1,GETDATE(),'accepted',null);
insert into [post]([user_id],[post_content],[post_image],[isPublic],[timePosted],[status],[reason])
values(3,'Lạnh quá','https://i.pinimg.com/236x/ee/36/5e/ee365e32d01bf5f50f2c0873b45a0feb.jpg',1,GETDATE(),'accepted',null);
insert into [post]([user_id],[post_content],[post_image],[isPublic],[timePosted],[status],[reason])
values(2,'Đẹp trai','https://i.pinimg.com/236x/d1/04/a3/d104a35607cc1d9ea521675ea7587a9a.jpg',1,GETDATE(),'accepted',null);

--Chạy xong cái ở trên thì chạy cái này dấu ? anh em tự điền 
insert into [categoryLinkpost] ([post_id],[category_id]) values (?,5)
insert into [categoryLinkpost] ([post_id],[category_id]) values (?,6)
insert into [categoryLinkpost] ([post_id],[category_id]) values (?,7)
insert into [categoryLinkpost] ([post_id],[category_id]) values (?,8)
insert into [categoryLinkpost] ([post_id],[category_id]) values (?,9)

