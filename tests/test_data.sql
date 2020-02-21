INSERT INTO reviewers(id, username) VALUES
  (1, 'pedant72'),
  (2, 'consistent_steve52'),
  (3, 'flakey_jack_johnson24');

INSERT INTO roast_curves(id, nickname) VALUES
  (1, 'smooth'),
  (2, 'spikey'),
  (3, 'mountain');

INSERT INTO roast_curve_points(roast_curve_id, temp, at_time_s) VALUES
  -- smooth curve
  (1, 250.0, 0),
  (1, 350.0, 30),
  (1, 450.0, 200),
  (1, 400.0, 300),
  (1, 120.0, 600),
  -- spikey curve
  (2, 250.0, 0),
  (2, 450.0, 30),
  (2, 350.0, 100),
  (2, 450.0, 200),
  (2, 350.0, 300),
  (2, 450.0, 400),
  (2, 150.0, 500),
  -- mountain curve
  (3, 250.0, 0),
  (3, 550.0, 30),
  (3, 550.0, 100),
  (3, 150.0, 300);

INSERT INTO bean_batch(id, origin, name, received) VALUES
  (1, 'Ethiopia', 'Agaro', '2012-05-04 17:36:00'),
  (2, 'Ethiopia', 'Guji', '2012-05-05 17:36:00'),
  (3, 'Guatemala', 'Patzun', '2014-06-19 07:18:00')
  ;

INSERT INTO roasts(
  id, roast_curve_id,   bean_batch_id,            ambient_temp, humidity) VALUES
  (1, 1 /* smooth */,   1 /* Ethiopia Agaro */,   70.0,         0.50),
  (2, 1 /* smooth */,   2 /* Ethiopia Guji */,    70.0,         0.50),
  (3, 1 /* smooth */,   3 /* Guatemala Patzun*/,  70.0,         0.50),
  (4, 2 /* spikey */,   1 /* Ethiopia Agaro */,   71.0,         0.42),
  (5, 2 /* spikey */,   2 /* Ethiopia Guji */,    75.0,         0.40),
  (6, 3 /* mountain */, 1 /* Ethiopia Agaro */,   76.0,         0.54),
  (7, 3 /* mountain */, 2 /* Ethiopia Guji */,    77.0,         0.41),
  (8, 3 /* mountain */, 3 /* Guatemala Patzun*/,  70.0,         0.50);

/* For the sake of simplicity, we'll only specify a few columns
Pedant is just always negative and has a bad day so rarely shows up
Consistent Steve:
  * tastes roasts 2 and 3
  * is pretty consistent
  * had one bad day that we just ignore.
Flakey Jack Johnson:
  * is all over the place
  * and only tries one roast
  * had one bad day
*/
INSERT INTO reviews(
  id,    reviewer_id,     roast_id,  score, nice_day        ) VALUES
----------------------------------------------------------------------
 (1,  1 /* pedant72   */, 1,         2.5,   'Strongly Disagree' ),
----------------------------------------------------------------------
 (2,  2 /* cons_steve */, 2,         8.5,   'Strongly Agree'    ),
 (3,  2 /* cons_steve */, 2,         8.4,   'Strongly Agree'    ),
 (4,  2 /* cons_steve */, 3,         7.2,   'Agree'             ),
 (5,  2 /* cons_steve */, 3,         7.4,   'Neutral'           ),
 (6,  2 /* cons_steve */, 3,         2.4,   'Strongly Disagree' ),
----------------------------------------------------------------------
 (7,  3 /* flakey_jj */,  2,         2.5,   'Strongly Agree'    ),
 (8,  3 /* flakey_jj */,  2,         5.5,   'Strongly Agree'    ),
 (9,  3 /* flakey_jj */,  2,         9.9,   'Strongly Agree'    ),
 (10, 3 /* flakey_jj */,  2,         1.5,   'Strongly Agree'    ),
 (11, 3 /* flakey_jj */,  2,         0.0,   'Strongly Disagree'    );
