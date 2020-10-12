USE [SampleDb];


CREATE TABLE [SampleDb].[dbo].[Blog] (
    [id] int NOT NULL PRIMARY KEY,
    [url] nvarchar(max)
);

CREATE TABLE [SampleDb].[dbo].[Post] (
    [id] int NOT NULL PRIMARY KEY,
    [blog_id] int NOT NULL,
    [title] nvarchar(max),
    [content] nvarchar(max),
    FOREIGN KEY ([blog_id]) REFERENCES [SampleDb].[dbo].[Blog]([id])
);


-- Blog

EXEC sys.sp_addextendedproperty  @name=N'MS_Description'
                                ,@value=N'ブログ'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE'
                                ,@level1name=N'Blog';

EXEC sys.sp_addextendedproperty  @name=N'MS_Description'
                                ,@value=N'ID'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE'
                                ,@level1name=N'Blog'
                                ,@level2type=N'COLUMN'
                                ,@level2name=N'id';

EXEC sys.sp_addextendedproperty  @name=N'MS_Description'
                                ,@value=N'ブログのURL'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE'
                                ,@level1name=N'Blog'
                                ,@level2type=N'COLUMN'
                                ,@level2name=N'url';

-- Post

EXEC sys.sp_addextendedproperty  @name=N'MS_Description'
                                ,@value=N'ポスト'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE'
                                ,@level1name=N'Post';

EXEC sys.sp_addextendedproperty  @name=N'MS_Description'
                                ,@value=N'ポストのID'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE'
                                ,@level1name=N'Post'
                                ,@level2type=N'COLUMN'
                                ,@level2name=N'id';

EXEC sys.sp_addextendedproperty  @name=N'MS_Description'
                                ,@value=N'ブログのID'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE'
                                ,@level1name=N'Post'
                                ,@level2type=N'COLUMN'
                                ,@level2name=N'blog_id';

EXEC sys.sp_addextendedproperty  @name=N'MS_Description'
                                ,@value=N'ポストのタイトル'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE'
                                ,@level1name=N'Post'
                                ,@level2type=N'COLUMN'
                                ,@level2name=N'title';

EXEC sys.sp_addextendedproperty  @name=N'MS_Description'
                                ,@value=N'ポストの内容'
                                ,@level0type=N'SCHEMA'
                                ,@level0name=N'dbo'
                                ,@level1type=N'TABLE'
                                ,@level1name=N'Post'
                                ,@level2type=N'COLUMN'
                                ,@level2name=N'content';
