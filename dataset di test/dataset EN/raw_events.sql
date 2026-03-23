INSERT INTO raw_events (event_id, event_time, payload_json) VALUES
(9001, TIMESTAMP '2024-03-01 10:15:00',
 '{"event":"login","user":"mrossi","device":"mobile","region":"EUROPE"}'),

(9002, TIMESTAMP '2024-03-01 10:20:00',
 '{"event":"purchase","user":"abianchi","amount":129.00,"product":"Mouse Wireless"}'),

(9003, TIMESTAMP '2024-03-01 11:00:00',
 '{"event":"logout","user":"mrossi"}'),

(9004, TIMESTAMP '2024-03-02 09:30:00',
 '{"event":"login","user":"jsmith","device":"desktop","region":"NORTH_AMERICA"}');
