DROP TABLE IF EXISTS airport;
CREATE TABLE IF NOT EXISTS airport (
  code varchar(5) NOT NULL,
  name varchar(45) DEFAULT NULL,
  PRIMARY KEY (code)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
INSERT INTO
  airport (code, name)
VALUES
  ('BRQ', 'Brno'),
  ('CDG', 'Paris Charles de Gaulle Airport'),
  ('CIA', 'Rome Ciampino'),
  ('DBV', 'Dubrovnik'),
  ('LGW', 'London Gatwick'),
  ('PRG', 'Prague');
DROP TABLE IF EXISTS flight;
CREATE TABLE IF NOT EXISTS flight (
    id int UNSIGNED NOT NULL AUTO_INCREMENT,
    code varchar(10) NOT NULL,
    from_dttm timestamp NOT NULL,
    from_airport_code varchar(5) NOT NULL,
    to_dttm timestamp NOT NULL,
    to_airport_code varchar(5) NOT NULL,
    gate_code varchar(3) NOT NULL,
    PRIMARY KEY (id),
    KEY fk_flight_airport_idx (from_airport_code),
    KEY fk_flight_airport1_idx (to_airport_code),
    KEY fk_flight_gate1_idx (gate_code)
  ) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb3;
INSERT INTO
  flight (
    id,
    code,
    from_dttm,
    from_airport_code,
    to_dttm,
    to_airport_code,
    gate_code
  )
VALUES
  (
    1,
    'OK 1234',
    '2022-04-11 10:11:00',
    'PRG',
    '2022-04-11 12:00:00',
    'CIA',
    'G2'
  ),
  (
    2,
    'OK 3214',
    '2022-04-12 08:13:02',
    'CIA',
    '2022-04-11 08:50:00',
    'PRG',
    'G2'
  ),
  (
    3,
    'HY 4578',
    '2022-04-11 12:00:00',
    'PRG',
    '2022-04-11 14:13:00',
    'LGW',
    'G1'
  ),
  (
    4,
    'LH 4571',
    '2022-04-19 10:00:00',
    'PRG',
    '2022-04-11 11:20:00',
    'BRQ',
    'G3'
  ),
  (
    5,
    'OK 222',
    '2022-04-20 08:20:00',
    'PRG',
    '2022-04-20 12:00:00',
    'CDG',
    'G1'
  ),
  (
    7,
    'OK 321',
    '2022-04-21 10:00:00',
    'PRG',
    '2022-04-21 11:00:00',
    'BRQ',
    'G1'
  ),
  (
    8,
    'LH 4571',
    '2022-04-18 10:00:00',
    'PRG',
    '2022-04-18 11:20:00',
    'BRQ',
    'G3'
  ),
  (
    9,
    'OK 222',
    '2022-04-27 08:20:00',
    'PRG',
    '2022-04-27 12:00:00',
    'CDG',
    'G1'
  );
DROP TABLE IF EXISTS gate;
CREATE TABLE IF NOT EXISTS gate (
    code varchar(3) NOT NULL,
    `desc` varchar(45) DEFAULT NULL,
    PRIMARY KEY (code)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
INSERT INTO
  gate (code, `desc`)
VALUES
  ('G1', NULL),
  ('G2', NULL),
  ('G3', NULL);
ALTER TABLE
  flight
ADD
  CONSTRAINT fk_flight_airport FOREIGN KEY (from_airport_code) REFERENCES airport (code),
ADD
  CONSTRAINT fk_flight_airport1 FOREIGN KEY (to_airport_code) REFERENCES airport (code),
ADD
  CONSTRAINT fk_flight_gate1 FOREIGN KEY (gate_code) REFERENCES gate (code);