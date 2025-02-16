CREATE DATABASE IF NOT EXISTS `douyin`; 
USE `douyin`;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
    `name`        varchar(32)        NOT NULL DEFAULT '' COMMENT '用户名称',
    `password`    varchar(32)        NOT NULL DEFAULT '' COMMENT '密码',
    `follow_count` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '关注总数',
    `follower_count` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '粉丝总数',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='用户表';

INSERT INTO `user`
VALUES (1, 'Jerry', 'jerry', 0, 0),
       (2, 'Tom', 'Tom', 1, 0),
       (3, 'Amy', 'Amy', 0, 1);

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '视频id',
    `user_id`     bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '用户id',
    `title`       varchar(128)        NOT NULL DEFAULT '' COMMENT '标题',
    `play_url`    varchar(128)        NOT NULL DEFAULT '' COMMENT '播放地址',
    `cover_url`   varchar(128)        NOT NULL DEFAULT '' COMMENT '封面地址',
    `favorite_count` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '点赞总数',
    `comment_count`  bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '评论总数',
    `create_date`    timestamp         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='视频表';

INSERT INTO `video`
VALUES (1, 1, 'bear', 'https://www.w3schools.com/html/movie.mp4', 'https://cdn.pixabay.com/photo/2016/03/27/18/10/bear-1283347_1280.jpg', 3, 2, CURRENT_TIMESTAMP);

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞id',
    `user_id`     bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '用户id',
    `video_id`    bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '视频id',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='点赞表';

INSERT INTO `favorite`
VALUES (1, 1, 1),
       (2, 2, 1),
       (3, 3, 1);

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
    `user_id`     bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '用户id',
    `video_id`    bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '视频id',
    `contents`    text                NOT NULL COMMENT '评论内容',
    `create_date` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='评论表';

INSERT INTO `comment`
VALUES (1, 1, 1, '这视频也太模糊了！', CURRENT_TIMESTAMP),
       (2, 2, 1, '老CCTV了～', CURRENT_TIMESTAMP);


/*关注状态 -1表示当前用户关注对方用户，0表示两者相互关注，1表示对方用户关注当前用户*/
DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '关注id',
    `user_id`     bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '用户id',
    `to_user_id`  bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '对方用户id',
    `status`      tinyint             NOT NULL DEFAULT -1 COMMENT '关注状态',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='关注表';

INSERT INTO `relation`
VALUES (1, 2, 3, -1);





