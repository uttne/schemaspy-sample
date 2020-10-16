
-- CREATE TABLE `Blog` (
--     `id` int NOT NULL PRIMARY KEY COMMENT 'blog id',
--     `url` text COMMENT 'blog URL'
-- )
-- DEFAULT CHARSET=utf8
-- COMMENT 'blog';

CREATE TABLE `Blog` (
    `id` int NOT NULL PRIMARY KEY COMMENT 'ブログのID',
    `url` text COMMENT 'ブログのURL'
)
DEFAULT CHARSET=utf8
COMMENT 'ブログ';

CREATE TABLE `Post` (
    `id` int NOT NULL PRIMARY KEY COMMENT 'ポストのID',
    `blog_id` int NOT NULL COMMENT 'ブログのID',
    `title` text COMMENT 'ポストのタイトル',
    `content` text COMMENT 'ポストの内容',
    FOREIGN KEY (`blog_id`) REFERENCES `Blog`(`id`)
)
DEFAULT CHARSET=utf8
COMMENT 'ポスト';
