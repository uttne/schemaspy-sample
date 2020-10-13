CREATE TABLE "Blog" (
    "id" int NOT NULL PRIMARY KEY,
    "url" text
);

CREATE TABLE "Post" (
    "id" int NOT NULL PRIMARY KEY,
    "blog_id" int NOT NULL,
    "title" text,
    "content" text,
    FOREIGN KEY ("blog_id") REFERENCES "Blog"("id")
);


-- Blog

COMMENT ON TABLE "Blog" IS 'ブログ';

COMMENT ON COLUMN "Blog"."id" IS 'ブログのID';
COMMENT ON COLUMN "Blog"."url" IS 'ブログのURL';

-- -- Post

COMMENT ON TABLE "Post" IS 'ポスト';

COMMENT ON COLUMN "Post"."id" IS 'ポストのID';
COMMENT ON COLUMN "Post"."blog_id" IS 'ブログのID';
COMMENT ON COLUMN "Post"."title" IS 'ポストのタイトル';
COMMENT ON COLUMN "Post"."content" IS 'ポストの内容';
