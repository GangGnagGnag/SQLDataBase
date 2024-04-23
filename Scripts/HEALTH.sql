CREATE TABLE MEMBER (
    MEMBERID VARCHAR2(100) PRIMARY KEY , -- 회원 아이디
    MEMBERPW NUMBER NOT NULL,    -- 회원 비번
    MEMBERNAME VARCHAR2(100) NOT NULL, -- 회원이름
    MEMBERCOUNT NUMBER -- PT횟수
);

SELECT MEMBERID AS 아이디,
       MEMBERPW AS 비밀번호,
       MEMBERNAME AS 회원이름,
       MEMBERCOUNT AS 등록횟수
FROM MEMBER;

COMMIT;

DELETE FROM MEMBER
WHERE MEMBERID = '010-9999-6666';

---------------------------------------------------------

CREATE TABLE PT (
    MEMBERID VARCHAR2(100),
    EXERCISE VARCHAR2(100),
    DATEDAY  NUMBER,
    KG       NUMBER,
    SETTING  NUMBER
);

SELECT MEMBERID AS 아이디,
       DATEDAY  AS 날짜,
       EXERCISE AS 운동,
       KG       AS 무게,
       SETTING  AS 세트
FROM PT;

COMMIT;

-------------------------------------------------

SELECT DISTINCT
    M.MEMBERNAME AS 회원이름,
    M.MEMBERID AS 아이디,
    M.MEMBERPW AS 비밀번호,
    M.MEMBERCOUNT AS 등록횟수,
    PT.DATEDAY AS 날짜,
    PT.EXERCISE AS 운동,
    PT.KG AS 무게,
    PT.SETTING AS 세트
FROM
    MEMBER M
        JOIN
    PT ON M.MEMBERID = PT.MEMBERID
ORDER BY
    M.MEMBERNAME ASC, PT.DATEDAY ASC; -- 이름 날짜 오름차순

COMMIT;
