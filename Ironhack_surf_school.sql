USE surf;

SELECT *
FROM df_surf;

CREATE TABLE wave AS
SELECT wave_height, wave_shape, wave_height_min, wave_height_max, wave_height_mean, wave_height_interval
FROM df_surf;

CREATE TABLE surfer AS
SELECT surfer_age, surfer_exercise_frequency, surfer_experience, surfer_gender, surfer_height, surfer_style, surfer_weight
FROM df_surf;

CREATE TABLE manoeuvres AS
SELECT manoeuvres_01_paddling, manoeuvres_02_drop, manoeuvres_03_straight_ahead, manoeuvres_04_wall_riding, manoeuvres_05_floater, manoeuvres_06_cut_back, manoeuvres_07_carve, manoeuvres_08_off_the_lip, manoeuvres_09_tube, manoeuvres_10_air
FROM df_surf;

CREATE TABLE performance AS
SELECT performance_control, performance_ease_paddling, performance_flotation, performance_hold, performance_manoeuvrability, performance_passing_through, performance_stability, performance_surf_speed
FROM df_surf;

CREATE TABLE surfboard AS
SELECT board_adequate, board_how_many, board_length, board_nose_rocker, board_nose_shape, board_tail_rocker, board_tail_shape, board_thickness, board_type, board_volume, board_width
FROM df_surf;

ALTER TABLE surfer
ADD COLUMN surfer_id INT AUTO_INCREMENT PRIMARY KEY,
ADD COLUMN surfboard_id INT,
ADD CONSTRAINT fk_surfer_surfboard FOREIGN KEY (surfboard_id) REFERENCES surfboard(surfboard_id);

ALTER TABLE surfboard
ADD COLUMN surfboard_id INT AUTO_INCREMENT PRIMARY KEY,
ADD COLUMN surfer_id INT,
ADD CONSTRAINT fk_surfboard_surfer FOREIGN KEY (surfer_id) REFERENCES surfer(surfer_id);

ALTER TABLE wave
ADD COLUMN wave_id INT AUTO_INCREMENT PRIMARY KEY,
ADD COLUMN surfer_id INT,
ADD CONSTRAINT fk_wave_surfer FOREIGN KEY (surfer_id) REFERENCES surfer(surfer_id);

ALTER TABLE performance
ADD COLUMN surfer_id INT AUTO_INCREMENT PRIMARY KEY,
ADD COLUMN surfboard_id INT,
ADD CONSTRAINT fk_performance_surfer FOREIGN KEY (surfboard_id) REFERENCES surfboard(surfboard_id);

ALTER TABLE performance
DROP FOREIGN KEY fk_performance_surfer;

SELECT CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'performance' AND COLUMN_NAME = 'surfer_id';

ALTER TABLE performance
DROP COLUMN surfer_id;

ALTER TABLE performance
DROP COLUMN performance_id;

SELECT *
FROM performance;

ALTER TABLE manoeuvres
ADD COLUMN surfer_id INT AUTO_INCREMENT PRIMARY KEY,
ADD COLUMN surfboard_id INT,
ADD CONSTRAINT fk_manoeuvres_surfer FOREIGN KEY (surfboard_id) REFERENCES surfboard(surfboard_id);

ALTER TABLE manoeuvres
DROP FOREIGN KEY fk_manoeuvres_surfer;

SELECT CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'manoeuvres' AND COLUMN_NAME = 'surfer_id';

ALTER TABLE manoeuvres
DROP COLUMN surfer_id;

SELECT *
FROM manoeuvres;

SELECT *
FROM surfboard;

SELECT board_type, COUNT(board_type)
FROM surfboard
GROUP BY board_type
ORDER BY COUNT(board_type) DESC;

SELECT *
FROM surfer;

SELECT surfer_experience, COUNT(surfer_experience)
FROM surfer
GROUP BY surfer_experience;

SELECT board_type, surfer_experience, COUNT(board_type)
FROM surfboard s
JOIN surfer su
ON s.surfboard_id=su.surfer_id
GROUP BY s.board_type, su.surfer_experience
ORDER BY surfer_experience;

SELECT board_type, COUNT(board_type)
FROM surfboard
GROUP BY board_type;

SELECT *
FROM manoeuvres;

SELECT board_type, manoeuvres_03_straight_ahead, COUNT(board_type)
FROM surfboard s
JOIN manoeuvres ma
ON s.surfboard_id=ma.surfer_id
GROUP BY s.board_type, ma.manoeuvres_03_straight_ahead
ORDER BY manoeuvres_03_straight_ahead;

SELECT board_type, manoeuvres_03_straight_ahead, COUNT(board_type)
FROM surfboard s
JOIN manoeuvres ma
ON s.surfboard_id=ma.surfer_id
GROUP BY s.board_type, ma.manoeuvres_03_straight_ahead
HAVING manoeuvres_03_straight_ahead = "Always";

SELECT manoeuvres_03_straight_ahead, surfer_experience, COUNT(surfer_experience)
FROM manoeuvres ma
JOIN surfer su
ON ma.surfer_id=su.surfer_id
GROUP BY ma.manoeuvres_03_straight_ahead, su.surfer_experience
ORDER BY manoeuvres_03_straight_ahead ;

SELECT manoeuvres_03_straight_ahead, surfer_experience, COUNT(surfer_experience), board_type, COUNT(board_type)
FROM manoeuvres ma
JOIN surfer su
ON ma.surfer_id=su.surfer_id
JOIN surfboard s
ON s.surfboard_id=su.surfer_id
GROUP BY ma.manoeuvres_03_straight_ahead, su.surfer_experience, s.board_type
ORDER BY manoeuvres_03_straight_ahead ;

SELECT *
FROM performance;

SELECT board_type, performance_flotation, COUNT(board_type)
FROM surfboard s
JOIN performance p
ON s.surfboard_id=p.surfer_id
GROUP BY s.board_type, p.performance_flotation
HAVING performance_flotation = "Excellent";

SELECT board_type, performance_manoeuvrability, COUNT(board_type)
FROM surfboard s
JOIN performance p
ON s.surfboard_id=p.surfer_id
GROUP BY s.board_type, p.performance_manoeuvrability
HAVING performance_manoeuvrability > 0.5
ORDER BY performance_manoeuvrability;

SELECT *
FROM wave;

SELECT board_type, wave_shape, COUNT(board_type)
FROM surfboard s
JOIN wave w
ON s.surfboard_id=w.wave_id
GROUP BY s.board_type, w.wave_shape
ORDER BY board_type;

SELECT board_type, wave_height, COUNT(board_type)
FROM surfboard s
JOIN wave w
ON s.surfboard_id=w.wave_id
GROUP BY s.board_type, w.wave_height
ORDER BY board_type;

SELECT wave_shape, wave_height, board_type, COUNT(board_type)
FROM surfboard s
JOIN wave w
ON s.surfboard_id=w.wave_id
GROUP BY s.board_type, w.wave_height, w.wave_shape
HAVING board_type="Funboard";