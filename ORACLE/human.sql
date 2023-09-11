
-- 테이블 생성
CREATE TABLE BOARD (
  BOARD_NO NUMBER PRIMARY KEY,
  TITLE VARCHAR2(100),
  WRITER VARCHAR2(100),
  CONTENT VARCHAR2(2000),
  REG_DATE DATE DEFAULT SYSDATE,
  UPD_DATE DATE DEFAULT SYSDATE,
  VIEWS NUMBER DEFAULT 0
);

-- 시퀀스 생성
DROP SEQUENCE SEQ_BOARD;
CREATE SEQUENCE  SEQ_BOARD
MINVALUE 1 
MAXVALUE 10000 
INCREMENT BY 1 
;

TRUNCATE TABLE board;
INSERT INTO board( board_no, title, writer, content )
VALUES ( SEQ_BOARD.nextval, '제목01', '작성자01', '내용01');
INSERT INTO board( board_no, title, writer, content )
VALUES ( SEQ_BOARD.nextval, '제목02', '작성자02', '내용02');
INSERT INTO board( board_no, title, writer, content )
VALUES ( SEQ_BOARD.nextval, '제목03', '작성자03', '내용03');
INSERT INTO board( board_no, title, writer, content )
VALUES ( SEQ_BOARD.nextval, '제목04', '작성자04', '내용04');
INSERT INTO board( board_no, title, writer, content )
VALUES ( SEQ_BOARD.nextval, '제목05', '작성자05', '내용05');

-- 4번
INSERT INTO board( board_no, title, writer, content )
SELECT SEQ_BOARD.nextval, title, writer, content
FROM board;

SELECT * FROM board ORDER BY board_no DESC;
SELECT COUNT(*) FROM board;
SELECT * FROM board ORDER BY reg_date DESC;

-- 페이징 처리 (일반화)
SELECT *
FROM (
    SELECT ROWNUM no
          ,board_no
          ,writer
          ,content
          ,reg_date
          ,upd_date
          ,views
    FROM board
    ORDER BY board_no DESC
) b
WHERE no > ((page-1) * count)       -- 시작 글번호
    AND no <= (page * count)        -- 끝 글번호
;


-- 댓글 테이블 (Oracle)
CREATE TABLE comments (
  "comment_no" NUMBER NOT NULL,
  "parent_table" VARCHAR2(100) NOT NULL,
  "parent_no" NUMBER NOT NULL,
  "writer" VARCHAR2(100) NOT NULL,
  "content" CLOB NOT NULL,
  "group_no" NUMBER NOT NULL,
  "super_no" NUMBER NOT NULL,
  "depth_no" NUMBER NOT NULL,
  "seq_no" NUMBER NOT NULL,
  "reg_date" TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
  "upd_date" TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
  "sub_count" NUMBER,
  CONSTRAINT "comment_pk" PRIMARY KEY ("comment_no")
);


-- 댓글 테이블 (MySQL)
CREATE TABLE `comments` (
  `comment_no` int NOT NULL AUTO_INCREMENT,
  `parent_table` varchar(100) NOT NULL,
  `parent_no` int NOT NULL,
  `writer` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `group_no` int NOT NULL,
  `super_no` int NOT NULL,
  `depth_no` int NOT NULL,
  `seq_no` int NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sub_count` int DEFAULT NULL,
  PRIMARY KEY (`comment_no`)
) COMMENT='댓글';
