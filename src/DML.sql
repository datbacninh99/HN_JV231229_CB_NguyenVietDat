USE QuanLyDiemThi;

# Bài 2
# 1. Thêm dữ liệu vào các bảng
INSERT INTO student (studentId, studentName, birthday, gender, address, phoneNumber)
VALUES ('S001', 'Nguyễn Thế Anh', '1999-11-01', 1, 'Hà Nội', '984678082'),
       ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
       ('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '938472615'),
       ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '912345678'),
       ('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang ', '987654564'),
       ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Đinh', '987654656'),
       ('S007', 'Giang Gia Hân', '1996-11-04', 0, 'Phú Thọ', '987654234'),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '987654321'),
       ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '987654557'),
       ('S010', 'Nguyễn Thiều Quang', '2000-09-03', 1, 'Hà Nội', '987654291');

INSERT INTO Subject (subjectId, subjectName, priority)
VALUES ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hóa Học', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);

INSERT INTO Mark (studentId, subjectId, point)
VALUES ('S001', 'MH01', 8.5),
       ('S001', 'MH02', 7),
       ('S001', 'MH03', 9),
       ('S001', 'MH04', 9),
       ('S001', 'MH05', 5),
       ('S002', 'MH01', 9),
       ('S002', 'MH02', 8),
       ('S002', 'MH03', 6.5),
       ('S002', 'MH04', 8),
       ('S002', 'MH05', 6),
       ('S003', 'MH01', 7.5),
       ('S003', 'MH02', 6.5),
       ('S003', 'MH03', 8),
       ('S003', 'MH04', 7),
       ('S003', 'MH05', 7),
       ('S004', 'MH01', 6),
       ('S004', 'MH02', 7),
       ('S004', 'MH03', 5),
       ('S004', 'MH04', 6.5),
       ('S004', 'MH05', 8),
       ('S005', 'MH01', 5.5),
       ('S005', 'MH02', 8),
       ('S005', 'MH03', 7.5),
       ('S005', 'MH04', 8.5),
       ('S005', 'MH05', 9),
       ('S006', 'MH01', 8),
       ('S006', 'MH02', 10),
       ('S006', 'MH03', 9),
       ('S006', 'MH04', 7.5),
       ('S006', 'MH05', 6.5),
       ('S007', 'MH01', 9.5),
       ('S007', 'MH02', 9),
       ('S007', 'MH03', 6),
       ('S007', 'MH04', 9),
       ('S007', 'MH05', 4),
       ('S008', 'MH01', 10),
       ('S008', 'MH02', 8.5),
       ('S008', 'MH03', 8.5),
       ('S008', 'MH04', 6),
       ('S008', 'MH05', 9.5),
       ('S009', 'MH01', 7.5),
       ('S009', 'MH02', 7),
       ('S009', 'MH03', 9),
       ('S009', 'MH04', 5),
       ('S009', 'MH05', 10),
       ('S010', 'MH01', 6.5),
       ('S010', 'MH02', 8),
       ('S010', 'MH03', 5.5),
       ('S010', 'MH04', 4),
       ('S010', 'MH05', 7);

# 2. Cập nhật dữ liệu
-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”
UPDATE Student
SET studentName = 'Đỗ Đức Mạnh'
WHERE studentId = 'S004';

-- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1
UPDATE Subject
SET subjectName = 'Ngoại Ngữ',
    priority    = 1
WHERE subjectId = 'MH05';

-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9)
UPDATE Mark
SET point = CASE
                WHEN subjectId = 'MH01' THEN 8.5
                WHEN subjectId = 'MH02' THEN 7
                WHEN subjectId = 'MH03' THEN 5.5
                WHEN subjectId = 'MH04' THEN 6
                WHEN subjectId = 'MH05' THEN 9
    END
WHERE studentId = 'S009';

# 3. Xoá dữ liệu
-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT
DELETE
FROM Mark
WHERE studentId = 'S010';

DELETE
FROM Student
WHERE studentId = 'S010';

# Bài 3
# 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student
SELECT *
FROM Student;

# 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1
SELECT subjectId, subjectName
FROM Subject
WHERE priority = 1;

# 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ năm sinh), giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh
SELECT studentId,
       studentName,
    YEAR(CURDATE()) - YEAR(birthday) AS `Tuổi`,
    CASE
    WHEN gender = 1 THEN 'Nam'
    ELSE 'Nữ'
END                          AS `Giới tính`,
       address                          AS `Quê quán`
FROM Student;

# 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học, điểm thi của tất cả học sinh của môn Toán và sắp xếp theo điểm giảm dần
SELECT Student.studentName AS `Tên học sinh`,
       Subject.subjectName AS `Tên môn học`,
       Mark.point          AS `Điểm thi`
FROM Student
         JOIN
     Mark ON Student.studentId = Mark.studentId
         JOIN
     Subject ON Mark.subjectId = Subject.subjectId
WHERE Subject.subjectName = 'Toán'
ORDER BY Mark.point DESC;

# 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng)
SELECT CASE
           WHEN gender = 1 THEN 'Nam'
           ELSE 'Nữ'
           END  AS `Giới tính`,
       COUNT(*) AS `Số lượng`
FROM Student
GROUP BY gender;

# 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm để tính toán), bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình
SELECT Student.studentId,
       Student.studentName,
       SUM(Mark.point) AS `Tổng điểm`,
       AVG(Mark.point) AS `Điểm trung bình các môn`
FROM Student
         JOIN
     Mark ON Student.studentId = Mark.studentId
GROUP BY Student.studentId, Student.studentName;

# Bài 4
# 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính, quê quán
CREATE VIEW STUDENT_VIEW AS
SELECT studentId,
       studentName,
       CASE
           WHEN gender = 1 THEN 'Nam'
           ELSE 'Nữ'
           END AS gender,
       address AS hometown
FROM Student;

# 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm: mã học sinh, tên học sinh, điểm trung bình các môn học
CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT Student.studentId,
       Student.studentName,
       AVG(Mark.point) AS `Điểm trung bình các môn học`
FROM Student
         JOIN
     Mark ON Student.studentId = Mark.studentId
GROUP BY Student.studentId, Student.studentName;

# 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT
CREATE INDEX index_phoneNumber ON Student (phoneNumber);

# 4. Tạo các PROCEDURE sau:
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó
DELIMITER //

CREATE PROCEDURE PROC_INSERTSTUDENT(
    IN p_studentId VARCHAR(4),
    IN p_studentName VARCHAR(100),
    IN p_birthday DATE,
    IN p_gender BIT(1),
    IN p_address TEXT,
    IN p_phoneNumber VARCHAR(45)
)
BEGIN
INSERT INTO Student(studentId, studentName, birthday, gender, address, phoneNumber)
VALUES (p_studentId, p_studentName, p_birthday, p_gender, p_address, p_phoneNumber);
END;

DELIMITER //

-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học
DELIMITER //

CREATE PROCEDURE PROC_UPDATESUBJECT(
    IN p_subjectId VARCHAR(4),
    IN p_newSubjectName VARCHAR(45)
)
BEGIN
UPDATE Subject
SET subjectName = p_newSubjectName
WHERE subjectId = p_subjectId;
END;

DELIMITER //

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh
DELIMITER //

CREATE PROCEDURE PROC_DELETEMARK(
    IN p_studentId VARCHAR(4)
)
BEGIN
DELETE FROM Mark
WHERE studentId = p_studentId;
END;

DELIMITER //