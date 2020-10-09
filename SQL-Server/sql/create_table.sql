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
