IF EXISTS(SELECT 1 FROM sys.databases WHERE [name] = 'SampleDb')
BEGIN
    DROP DATABASE [SampleDb];
END

CREATE DATABASE [SampleDb];