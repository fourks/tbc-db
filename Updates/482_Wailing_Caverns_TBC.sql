-- ===========================
-- WAILING CAVERNS TBC UPDATES
-- ===========================

-- ======================================
-- All Bosses Are Immune To Crowd Control -- Daze, Horror, Shackle, Banish, Polymorph, Knockout, Freeze, Stun, Snare, Sleep, Silence, Pacify, Root, Fear, Distract, Disarm, Confused, Charm
-- ======================================
UPDATE creature_template SET MechanicImmuneMask=MechanicImmuneMask|76234719 WHERE entry IN (3671,3669,3670,3673,3655,3654,3674,5775);

-- ========================
-- Fix Naralex Gossip Emote - Should Not Talk Emote (He is Sleeping)
-- ========================
UPDATE npc_text SET em0_0=0, em0_1=0, em0_2=0, em0_3=0, em0_4=0, em0_5=0 WHERE id IN (698);

-- The Wailing Caverns
-- Main Hall

-- Duplicates removed
DELETE FROM creature WHERE guid IN (27349,26256,27359,27367,27360);
DELETE FROM creature_addon WHERE guid IN (27349,26256,27359,27367,27360);
DELETE FROM creature_movement WHERE id IN (27349,26256,27359,27367,27360);
-- Missing added
DELETE FROM creature WHERE guid IN (27353,18688); -- empty guids from creatures deleted in this instance
INSERT INTO creature (guid, id, map, spawnMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(27353,3636,43,1,0,0,18.9434,284.015,-87.7345,0.44334,7200,5,0,1251,0,0,1),
(18688,3636,43,1,0,0,4.29095,303.612,-87.6656,1.08737,7200,5,0,1251,0,0,1);

-- Deviate Moccasin / NIGHTMARE_ECTOPLASM / MUTANUS - they must ignore MMaps to work correctly
UPDATE creature_template SET ExtraFlags = 16384 WHERE entry IN (3654,5762,5763);

-- Deviate Guardian/Ravager
UPDATE creature SET position_x = -107.136887, position_y = 243.697266, position_z = -93.119705, orientation = 4.852786, spawndist = 2, MovementType = 1 WHERE guid = 26202;
UPDATE creature SET position_x = -100.263298, position_y = 180.224976, position_z = -78.493256, orientation = 2.959969, spawndist = 2, MovementType = 1 WHERE guid = 26224;
UPDATE creature SET position_x = -4.321824, position_y = 307.168152, position_z = -88.147560, spawndist = 2, MovementType = 1 WHERE guid = 27364;
-- snake
UPDATE creature SET position_x = -53.176250, position_y = 263.859100, position_z = -92.843735 WHERE guid = 26238;
-- Deviate Crocolisk
UPDATE creature_template SET SpeedWalk = 1 WHERE entry = 5053;
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE guid IN (26197,33978,18678,26206,33970,26257,26258,26254,27365,27374);

-- Evolving Ectoplasm
UPDATE creature_template_addon SET auras = 7940 WHERE entry = 3640;
-- #26200
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (26200,26229,27363);
DELETE FROM creature_movement WHERE id IN (26200,26229,27363);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(26200,1,-68.1524,203.433,-93.674,0,0,1.31066,0,0),
(26200,2,-69.961,212.707,-93.5038,0,0,2.09606,0,0),
(26200,3,-78.7136,218.987,-94.0952,0,0,2.09606,0,0),
(26200,4,-85.6643,225.037,-93.2043,0,0,2.44714,0,0),
(26200,5,-100.668,231.587,-91.4226,0,0,3.39276,0,0),
(26200,6,-110.268,230.005,-90.4413,0,0,4.17815,0,0),
(26200,7,-111.443,214.012,-85.3093,0,0,4.86302,0,0),
(26200,8,-108.986,203.938,-81.9642,0,0,4.96669,0,0),
(26200,9,-111.286,213.68,-85.2575,0,0,1.56234,0,0),
(26200,10,-110.096,229.464,-90.3296,0,0,0.552158,0,0),
(26200,11,-101.01,231.305,-91.2858,0,0,5.88676,0,0),
(26200,12,-86.0461,225.309,-93.0858,0,0,5.63151,0,0),
(26200,13,-78.9576,219.426,-94.0533,0,0,5.70848,0,0),
(26200,14,-70.0722,212.752,-93.5082,0,0,5.14928,0,0),
(26200,15,-68.2919,203.988,-93.6674,0,0,4.37077,0,0),
(26200,16,-79.1239,186.051,-93.1735,0,0,4.21762,0,0),
-- #26229 
(26229,1,-36.9481,192.669,-96.5478,0,0,4.9423,0,0),
(26229,2,-33.0708,177.147,-96.3141,0,0,4.47578,0,0),
(26229,3,-37.9909,156.333,-94.9096,0,0,4.24645,0,0),
(26229,4,-48.0045,140.481,-91.8653,0,0,4.39803,0,0),
(26229,5,-55.4778,122.223,-89.6402,0,0,4.28965,0,0),
(26229,6,-47.8948,140.425,-91.8465,0,0,1.01611,0,0),
(26229,7,-38.109,156.232,-94.8953,0,0,1.43865,0,0),
(26229,8,-33.0733,177.137,-96.3138,0,0,1.55803,0,0),
(26229,9,-37.0588,192.811,-96.5582,0,0,1.51248,0,0),
(26229,10,-35.1795,210.319,-96.2248,0,0,1.47164,0,0),
(26229,11,-32.656,228.21,-94.9624,0,0,1.5541,0,0),
(26229,12,-33.2975,242.874,-93.6593,0,0,1.96958,0,0),
(26229,13,-39.2168,256.586,-92.8235,0,0,1.65856,0,0),
(26229,14,-40.962,275.043,-92.4866,0,0,1.92874,0,0),
(26229,15,-46.6966,286.608,-92.4283,0,0,2.32772,0,0),
(26229,16,-57.9612,295.736,-90.1559,0,0,2.57512,0,0),
(26229,17,-46.9098,286.265,-92.4936,0,0,5.36407,0,0),
(26229,18,-41.2171,274.316,-92.5108,0,0,5.04913,0,0),
(26229,19,-39.8032,256.102,-92.8306,0,0,5.0672,0,0),
(26229,20,-33.2436,242.648,-93.6555,0,0,4.96667,0,0),
(26229,21,-33.0231,228.434,-94.9126,0,0,4.54963,0,0),
(26229,22,-34.8833,210.837,-96.1466,0,0,4.60932,0,0),
-- #27363
(27363,1,51.8623,209.877,-89.2127,0,0,2.15017,0,0),
(27363,2,48.2785,222.57,-88.5033,0,0,1.79282,0,0),
(27363,3,51.5756,212.811,-88.8591,0,0,5.61535,0,0),
(27363,4,60.3946,207.222,-91.6151,0,0,5.98288,0,0),
(27363,5,70.9029,206.649,-93.1381,0,0,0.284024,0,0),
(27363,6,83.4113,213.794,-92.9334,0,0,0.987741,0,0),
(27363,7,88.5347,230.272,-95.2437,0,0,0.879356,0,0),
(27363,8,96.3243,238.458,-95.8381,0,0,0.489013,0,0),
(27363,9,101.659,238.844,-95.8739,0,0,6.10775,0,0),
(27363,10,107.732,236.449,-96.0159,0,0,5.85878,0,0),
(27363,11,101.679,239.024,-95.8774,0,0,3.06974,0,0),
(27363,12,93.7623,237.393,-95.9306,0,0,3.64465,0,0),
(27363,13,87.7015,230.192,-95.2919,0,0,4.38214,0,0),
(27363,14,83.8539,215.539,-93.0563,0,0,4.17403,0,0),
(27363,15,77.8885,209.165,-92.959,0,0,3.55357,0,0),
(27363,16,71.0565,206.448,-93.1129,0,0,3.3101,0,0),
(27363,17,61.4155,207.113,-91.7314,0,0,3.10197,0,0);

-- Druid of the Fang
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (26239,27348,27357,26225);
DELETE FROM creature_movement WHERE id IN (26239,27348,27357,26225);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #26239 
(26239,1,-56.3975,265.139,-92.8434,0,0,2.85711,0,0),
(26239,2,-62.6119,267.854,-92.8434,0,0,2.3521,0,0),
(26239,3,-66.2731,274.048,-92.8434,0,0,1.86437,0,0),
(26239,4,-65.887,278.532,-92.5521,0,0,1.13097,0,0),
(26239,5,-62.0234,283.8,-91.974,0,0,0.756338,0,0),
(26239,6,-56.3948,286.851,-91.9572,0,0,0.270962,0,0),
(26239,7,-48.7796,283.578,-92.8443,0,0,5.73341,0,0),
(26239,8,-44.9437,278.699,-92.6976,0,0,5.164,0,0),
(26239,9,-42.87,272.868,-92.6368,0,0,4.90325,0,0),
(26239,10,-44.9356,268.481,-92.8257,0,0,3.99455,0,0),
(26239,11,-50.2492,264.342,-92.8442,0,0,3.51874,0,0),
-- #27348 
(27348,1,9.68975,197.043,-84.0878,0,0,4.78291,0,0),
(27348,2,10.2678,207.534,-84.3362,0,0,1.36014,0,0),
(27348,3,14.5732,222.643,-84.5247,0,0,1.23291,0,0),
(27348,4,20.72,235.967,-85.4468,0,0,1.00907,0,0),
(27348,5,29.986,250.396,-87.5133,0,0,1.6688,0,0),
(27348,6,28.1387,262.184,-87.385,0,0,2.24136,0,0),
(27348,7,13.8197,277.082,-86.2148,0,0,2.11648,0,0),
(27348,8,3.75275,292.614,-85.5411,0,0,2.31047,0,0),
(27348,9,-11.572,306.829,-88.4024,0,0,2.41493,0,0),
(27348,10,-30.8699,319.153,-89.2336,0,0,2.56023,0,0),
(27348,11,-11.0633,306.451,-88.3487,0,0,5.51254,0,0),
(27348,12,4.12528,291.684,-85.5452,0,0,5.45546,0,0),
(27348,13,14.0051,276.815,-86.2056,0,0,5.48688,0,0),
(27348,14,27.9405,261.821,-87.3832,0,0,5.11067,0,0),
(27348,15,30.0687,249.523,-87.435,0,0,4.55225,0,0),
(27348,16,25.2162,240.198,-86.165,0,0,4.21453,0,0),
(27348,17,14.3869,222.38,-84.5234,0,0,4.30878,0,0),
(27348,18,10.1017,210.273,-84.1564,0,0,4.59466,0,0),
(27348,19,9.74381,204.494,-84.1363,0,0,4.71718,0,0),
-- #27357 
(27357,1,49.4473,218.755,-88.6672,0,0,1.55818,0,0),
(27357,2,48.178,232.093,-88.5543,0,0,1.74275,0,0),
(27357,3,49.4085,218.762,-88.6588,0,0,4.3974,0,0),
(27357,4,43.1834,206.45,-88.2157,0,0,3.95129,0,0),
(27357,5,25.8099,200.155,-86.0444,0,0,3.69133,0,0),
(27357,6,13.8656,193.124,-84.9796,0,0,3.9694,0,0),
(27357,7,9.89033,184.731,-85.4648,0,0,4.57337,0,0),
(27357,8,10.3683,175.054,-86.6094,0,0,4.5875,0,0),
(27357,9,7.91235,167.02,-86.6623,0,0,4.41943,0,0),
(27357,10,1.81814,153.567,-88.56,0,0,4.26314,0,0),
(27357,11,-15.7426,119.127,-89.8857,0,0,4.28277,0,0),
(27357,12,-25.4447,101.016,-89.8553,0,0,4.52467,0,0),
(27357,13,-28.177,82.8804,-91.1606,0,0,4.39744,0,0),
(27357,14,-37.892,68.0999,-88.5432,0,0,4.08249,0,0),
(27357,15,-27.7804,83.4066,-91.2526,0,0,1.12704,0,0),
(27357,16,-25.3866,101.015,-89.871,0,0,1.10112,0,0),
(27357,17,-6.3389,137.829,-88.4654,0,0,1.10907,0,0),
(27357,18,7.90365,167.725,-86.6462,0,0,1.45639,0,0),
(27357,19,10.7275,177.886,-86.4483,0,0,1.52079,0,0),
(27357,20,9.73913,186.363,-85.4123,0,0,1.43911,0,0),
(27357,21,12.2051,191.933,-84.7278,0,0,0.766027,0,0),
(27357,22,26.7711,200.425,-86.1275,0,0,0.398735,0,0),
(27357,23,40.3936,204.973,-87.9399,0,0,0.621003,0,0),
(27357,24,46.2976,209.539,-88.3763,0,0,0.958724,0,0),
-- #26225
(26225,1,-40.4414,150.653,-94.0708,0,0,4.2188,0,0),
(26225,2,-46.9905,138.931,-91.4253,0,0,4.11278,0,0),
(26225,3,-63.7112,117.635,-89.222,0,0,3.83396,0,0),
(26225,4,-73.6791,111.54,-88.6808,0,0,3.68474,0,0),
(26225,5,-60.8873,122.093,-89.4241,0,0,0.904425,0,0),
(26225,6,-43.415,143.576,-92.526,0,0,1.13062,0,0),
(26225,7,-37.8829,157.212,-95.03,0,0,1.21701,0,0),
(26225,8,-36.1888,195.916,-96.7587,0,0,1.54295,0,0),
(26225,9,-35.4668,166.732,-96.1359,0,0,4.7356,0,0);

-- Kresh
UPDATE creature SET Spawndist = 0, MovementType = 2 WHERE guid = 27368;
DELETE FROM creature_movement WHERE id = 27368;
UPDATE creature_template SET MovementType = 2, SpeedWalk = 1 WHERE entry = 3653;
DELETE FROM creature_movement_template WHERE entry = 3653;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(3653,1,-44.8007,305.259,-106.417,0,0,5.56568,0,0),
(3653,2,-32.5041,290.754,-106.417,0,0,5.35127,0,0),
(3653,3,-20.8746,273.006,-106.417,0,0,5.13136,0,0),
(3653,4,-11.3159,247.89,-106.344,0,0,4.74102,0,0),
(3653,5,-8.17325,223.437,-106.163,0,0,4.71353,0,0),
(3653,6,-7.57741,202.096,-106.163,0,0,4.67584,0,0),
(3653,7,-8.89105,181.096,-106.163,0,0,4.6405,0,0),
(3653,8,-11.3937,163.913,-106.163,0,0,4.3499,0,0),
(3653,9,-16.1442,149.352,-106.163,0,0,4.39702,0,0),
(3653,10,-28.404,128.264,-106.163,0,0,4.12606,0,0),
(3653,11,-46.7483,102.631,-106.163,0,0,4.25958,0,0),
(3653,12,-52.9205,90.712,-106.163,0,0,4.53492,0,0),
(3653,13,-55.1093,83.4505,-106.163,0,0,4.22312,0,0),
(3653,14,-58.6901,76.3781,-106.163,0,0,3.97022,0,0),
(3653,15,-62.9525,72.3359,-106.163,0,0,3.48328,0,0),
(3653,16,-75.996,71.5946,-106.163,0,0,3.36782,0,0),
(3653,17,-84.1777,69.2621,-106.163,0,0,3.64035,0,0),
(3653,18,-92.3134,65.9368,-106.163,0,0,3.27122,0,0),
(3653,19,-100.357,66.2251,-106.259,0,0,2.80312,0,0),
(3653,20,-120.69,71.8824,-106.442,0,0,3.06701,0,0),
(3653,21,-139.212,71.107,-106.166,0,0,3.45657,0,0),
(3653,22,-150.104,65.7444,-106.311,0,0,3.89404,0,0),
(3653,23,-155.877,58.1956,-106.361,0,0,4.52157,0,0),
(3653,24,-154.651,32.4415,-106.648,0,0,4.82708,0,0),
(3653,25,-154.773,12.4538,-105.7,0,0,4.348,0,0),
(3653,26,-158.958,2.82365,-106.208,0,0,4.04719,0,0),
(3653,27,-173.109,-6.59597,-106.397,0,0,3.51705,0,0),
(3653,28,-190.102,-9.4344,-106.243,0,0,3.1267,0,0),
(3653,29,-169.26,-5.08474,-106.375,0,0,0.448495,0,0),
(3653,30,-156.951,6.08111,-106.009,0,0,1.07681,0,0),
(3653,31,-153.483,21.6673,-105.47,0,0,1.55198,0,0),
(3653,32,-154.685,51.2861,-106.352,0,0,1.34699,0,0),
(3653,33,-149.849,64.9798,-106.338,0,0,0.953333,0,0),
(3653,34,-139.068,71.1707,-106.154,0,0,0.311758,0,0),
(3653,35,-120.406,72.0676,-106.439,0,0,6.03417,0,0),
(3653,36,-109.081,70.1327,-106.401,0,0,6.08915,0,0),
(3653,37,-97.633,66.0886,-106.184,0,0,6.23837,0,0),
(3653,38,-88.6407,66.2216,-106.161,0,0,0.385583,0,0),
(3653,39,-80.4933,71.5953,-106.161,0,0,0.338459,0,0),
(3653,40,-63.3656,72.3782,-106.161,0,0,0.422497,0,0),
(3653,41,-56.8746,77.2352,-106.161,0,0,1.02333,0,0),
(3653,42,-52.9606,90.3188,-106.161,0,0,1.29036,0,0),
(3653,43,-45.6264,103.709,-106.161,0,0,0.948714,0,0),
(3653,44,-28.8159,127.738,-106.161,0,0,0.960495,0,0),
(3653,45,-19.063,141.466,-106.161,0,0,1.03118,0,0),
(3653,46,-12.2858,158.042,-106.161,0,0,1.45451,0,0),
(3653,47,-9.01831,171.966,-106.161,0,0,1.39561,0,0),
(3653,48,-7.55996,201.698,-106.161,0,0,1.60766,0,0),
(3653,49,-7.859,222.945,-106.161,0,0,1.6862,0,0),
(3653,50,-11.2468,247.599,-106.339,0,0,1.77652,0,0),
(3653,51,-16.3697,265.351,-106.417,0,0,1.88648,0,0),
(3653,52,-26.2989,282.527,-106.417,0,0,2.17315,0,0),
(3653,53,-39.9706,301.609,-106.417,0,0,2.38128,0,0),
(3653,54,-50.4176,309.288,-106.417,0,0,2.53836,0,0),
(3653,55,-72.4502,323.797,-106.162,0,0,2.38442,0,0),
(3653,56,-76.8971,329.161,-106.162,0,0,1.99722,0,0),
(3653,57,-77.1239,335.797,-106.162,0,0,1.3634,0,0),
(3653,58,-72.0056,353.657,-106.173,0,0,1.36733,0,0),
(3653,59,-70.9167,374.263,-105.182,0,0,1.67756,0,0),
(3653,60,-75.7733,401.265,-107.862,0,0,1.57546,0,0),
(3653,61,-72.2112,417.555,-107.009,0,0,0.850539,0,0),
(3653,62,-57.6043,427.606,-105.979,0,0,0.556015,0,0),
(3653,63,-71.9469,416.472,-107.104,0,0,4.17591,0,0),
(3653,64,-76.9202,400.773,-107.867,0,0,4.80423,0,0),
(3653,65,-75.4612,388.477,-106.392,0,0,4.93382,0,0),
(3653,66,-69.6617,368.65,-105.263,0,0,4.83172,0,0),
(3653,67,-72.0043,352.597,-106.162,0,0,4.49793,0,0),
(3653,68,-77.3223,330.255,-106.162,0,0,5.07125,0,0),
(3653,69,-73.4961,323.783,-106.162,0,0,5.64066,0,0),
(3653,70,-66.2326,318.345,-106.592,0,0,5.80559,0,0);

-- The Wailing Caverns
-- Left Wing

-- Duplicates removed
DELETE FROM creature WHERE guid IN (33938,27379,33967,33960,27388,33936);
DELETE FROM creature_addon WHERE guid IN (33938,27379,33967,33960,27388,33936);
DELETE FROM creature_movement WHERE id IN (33938,27379,33967,33960,27388,33936);

-- Deviate Viper
UPDATE creature SET position_x = 5.956939, position_y = 455.083618, position_z = -77.977341, spawndist = 2, MovementType = 1 WHERE guid = 33948;
UPDATE creature SET position_x = 17.332829, position_y = 434.110718, position_z = -80.834145, spawndist = 2, MovementType = 1 WHERE guid = 33949;
UPDATE creature SET position_x = -27.127914, position_y = 381.332458, position_z = -60.059540, spawndist = 2, MovementType = 1 WHERE guid = 27372;
UPDATE creature SET position_x = -7.147677, position_y = 504.356445, position_z = -56.001366, spawndist = 5, MovementType = 1 WHERE guid = 33951;
UPDATE creature SET position_x = -19.490566, position_y = 488.676270, position_z = -55.430050, spawndist = 5, MovementType = 1 WHERE guid = 33947;

-- Deviate Adder
UPDATE creature SET position_x = -84.996887, position_y = 481.093903, position_z = -66.405075, orientation = 0.965283 WHERE guid = 33934;
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (33952,33934);
DELETE FROM creature_movement WHERE id IN (33952,33934);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #33952 
(33952,1,18.3882,471.101,-88.0586,0,0,2.39738,0,0),
(33952,2,29.0196,455.613,-86.1838,0,0,5.12664,0,0),
(33952,3,31.3535,445.19,-85.3345,0,0,4.96956,0,0),
(33952,4,31.8656,437.95,-84.0014,0,0,4.49518,0,0),
(33952,5,29.3349,432.054,-83.1705,0,0,3.61004,0,0),
(33952,6,22.6037,431.228,-81.9907,0,0,2.87134,0,0),
(33952,7,17.624,434.439,-80.9945,0,0,2.17155,0,0),
(33952,8,12.3668,444.198,-79.534,0,0,2.17862,0,0),
(33952,9,6.53194,452.764,-77.8434,0,0,2.87526,0,0),
(33952,10,1.70567,452.306,-76.3355,0,0,4.16683,0,0),
(33952,11,0.497222,446.235,-74.9738,0,0,4.91399,0,0),
(33952,12,4.66517,437.492,-73.3332,0,0,5.01209,0,0),
(33952,13,4.9966,431.932,-71.3576,0,0,4.44897,0,0),
(33952,14,0.990924,422.873,-67.8055,0,0,4.08219,0,0),
(33952,15,-8.8705,415.241,-65.0212,0,0,3.83086,0,0),
(33952,16,-16.7775,409.627,-60.6643,0,0,3.74054,0,0),
(33952,17,-9.80849,414.747,-64.8074,0,0,0.649997,0,0),
(33952,18,1.41618,423.453,-68.0128,0,0,0.94138,0,0),
(33952,19,5.25315,433.678,-72.0517,0,0,1.55792,0,0),
(33952,20,4.72326,438.894,-73.789,0,0,1.87679,0,0),
(33952,21,0.419972,446.218,-74.9489,0,0,1.80453,0,0),
(33952,22,1.03652,451.119,-75.9471,0,0,1.05291,0,0),
(33952,23,3.76451,453.807,-77.2048,0,0,0.275362,0,0),
(33952,24,8.33111,453.161,-78.4086,0,0,5.69147,0,0),
(33952,25,13.1434,442.055,-79.5827,0,0,5.09379,0,0),
(33952,26,18.5203,433.383,-81.3881,0,0,5.65141,0,0),
(33952,27,24.043,430.722,-82.1867,0,0,6.26598,0,0),
(33952,28,29.6276,432.259,-83.2049,0,0,0.811386,0,0),
(33952,29,32.2469,436.867,-83.8849,0,0,1.45669,0,0),
(33952,30,31.5933,445.346,-85.3358,0,0,1.79805,0,0),
(33952,31,29.0614,454.303,-86.0651,0,0,1.97476,0,0),
-- #33934
(33934,1,-81.3997,486.056,-65.0403,0,0,0.838834,0,0),
(33934,2,-76.5929,489.002,-63.4276,0,0,0.0997735,0,0),
(33934,3,-68.2558,483.684,-61.237,0,0,5.50096,0,0),
(33934,4,-55.36,473.697,-57.5728,0,0,5.44206,0,0),
(33934,5,-49.505,464.937,-56.59,0,0,5.20644,0,0),
(33934,6,-55.0437,474.004,-57.5264,0,0,2.41278,0,0),
(33934,7,-74.0426,488.033,-62.9592,0,0,2.89894,0,0),
(33934,8,-77.8686,488.177,-63.8568,0,0,3.54666,0,0),
(33934,9,-83.133,484.854,-65.4919,0,0,4.09565,0,0),
(33934,10,-85.6188,479.08,-66.9086,0,0,4.50092,0,0),
(33934,11,-86.6055,468.673,-68.7278,0,0,4.31635,0,0),
(33934,12,-90.6928,463.931,-69.9754,0,0,3.61499,0,0),
(33934,13,-98.2663,463.126,-70.671,0,0,3.238,0,0),
(33934,14,-110.833,460.458,-71.7726,0,0,3.71002,0,0),
(33934,15,-115.395,456.6,-72.3846,0,0,4.20797,0,0),
(33934,16,-117.256,450.734,-72.6647,0,0,4.60983,0,0),
(33934,17,-112.016,436.477,-72.8273,0,0,5.14389,0,0),
(33934,18,-108.051,430.357,-73.3957,0,0,4.82817,0,0),
(33934,19,-111.652,414.39,-73.8526,0,0,4.38992,0,0),
(33934,20,-107.801,430.569,-73.4287,0,0,1.76826,0,0),
(33934,21,-116.12,451.115,-72.6451,0,0,1.47531,0,0),
(33934,22,-115.575,456.322,-72.403,0,0,1.15015,0,0),
(33934,23,-108.838,460.621,-71.6793,0,0,0.32941,0,0),
(33934,24,-90.2806,463.658,-69.9699,0,0,0.705616,0,0),
(33934,25,-86.2516,468.787,-68.6661,0,0,1.12152,0,0),
(33934,26,-85.1272,480.383,-66.5854,0,0,1.38855,0,0);

-- Druid of the Fang
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE guid = 27384;
UPDATE creature SET position_x = 40.250111, position_y = 477.857727, position_z = -65.968185, orientation = 5.372137 WHERE guid = 33964;
UPDATE creature SET position_x = 21.978088, position_y = 507.476837, position_z = -58.773094, spawndist = 10, MovementType = 1 WHERE guid = 33956;
UPDATE creature SET position_x = -31.707466, position_y = 473.150970, position_z = -53.801693, spawndist = 5, MovementType = 1 WHERE guid = 33946;
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (33964);
DELETE FROM creature_movement WHERE id IN (33964);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #33964 
(33964,1,51.2705,462.79,-65.6538,0,0,5.22684,0,0),
(33964,2,61.4426,441.233,-64.5607,0,0,5.12474,0,0),
(33964,3,66.6446,427.09,-64.1669,0,0,4.75718,0,0),
(33964,4,65.3818,411.521,-63.7163,0,0,4.08119,0,0),
(33964,5,66.97,428.045,-64.2591,0,0,1.77447,0,0),
(33964,6,53.7275,457.406,-65.408,0,0,2.00774,0,0),
(33964,7,50.3768,465.739,-65.2606,0,0,2.14518,0,0),
(33964,8,40.5128,478.114,-65.9229,0,0,1.91192,0,0),
(33964,9,41.5158,488.841,-64.2444,0,0,1.89115,0,0),
(33964,10,36.7258,497.087,-62.1721,0,0,2.54217,0,0),
(33964,11,27.2896,504.402,-60.0476,0,0,1.36015,0,0),
(33964,12,32.4338,515.703,-58.0155,0,0,1.94056,0,0),
(33964,13,27.5284,523.319,-57.4901,0,0,2.58359,0,0),
(33964,14,17.4092,523.534,-57.0785,0,0,3.55198,0,0),
(33964,15,-0.718095,509.193,-56.2755,0,0,3.84257,0,0),
(33964,16,-22.3696,489.422,-54.4679,0,0,3.87006,0,0),
(33964,17,-32.7447,475.967,-53.7104,0,0,4.08605,0,0),
(33964,18,-21.6127,490.094,-54.6732,0,0,0.889474,0,0),
(33964,19,-7.64358,498.594,-56.1589,0,0,0.818003,0,0),
(33964,20,0.0910954,509.674,-56.3452,0,0,0.766952,0,0),
(33964,21,12.5018,517.24,-57.3461,0,0,0.863243,0,0),
(33964,22,17.3274,523.661,-57.0825,0,0,0.429703,0,0),
(33964,23,27.2714,523.02,-57.5083,0,0,5.84895,0,0),
(33964,24,33.1255,514.965,-58.1352,0,0,5.12639,0,0),
(33964,25,41.5672,488.218,-64.3173,0,0,5.06356,0,0);

-- The Wailing Caverns
-- Right Wing

-- Duplicates removed
DELETE FROM creature WHERE guid IN (38144,38113,85947,85961,38117);
DELETE FROM creature_addon WHERE guid IN (38144,38113,85947,85961,38117);
DELETE FROM creature_movement WHERE id IN (38144,38113,85947,85961,38117);

-- Skum
UPDATE creature SET position_x = -283.573700, position_y = -310.881409, position_z = -69.183708, orientation = 0.564664, spawndist = 10, MovementType = 1 WHERE guid = 87131;

-- Deviate Faerie Dragon
UPDATE creature SET position_x = 3.990831, position_y = -48.752422, position_z = -66.029633, orientation = 4.191853 WHERE guid = 517;
-- should have reduced chance to spawn in WC
DELETE FROM pool_template WHERE entry = 25492;
INSERT INTO pool_template (entry, max_limit, description) VALUES 
(25492,1,'WC - Deviate Faerie Dragon / Druid of the Fang');
DELETE FROM pool_creature WHERE pool_entry = 25492;
INSERT INTO pool_creature (guid, pool_entry, chance, description) VALUES 
(517,25492,35,'WC - Deviate Faerie Dragon'),
(85959,25492,65,'WC - Druid of the Fang');

-- Deviate Lasher
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE guid IN (18679,18681,18680);

-- Deviate Shambler
UPDATE creature SET position_x = 22.807135, position_y = -151.118713, position_z = -78.651627 WHERE guid = 85963;
UPDATE creature SET position_x = -7.038766, position_y = -71.016472, position_z = -67.098122, spawndist = 5, MovementType = 1 WHERE guid = 85954;
UPDATE creature SET position_x = -166.194336, position_y = -89.008423, position_z = -67.355522, spawndist = 5, MovementType = 1 WHERE guid = 45723;
UPDATE creature SET position_x = -226.982697, position_y = 44.669109, position_z = -82.440079, spawndist = 5, MovementType = 1 WHERE guid = 38114;
UPDATE creature SET position_x = -112.500587, position_y = -104.252632, position_z = -75.274391, spawndist = 2, MovementType = 1 WHERE guid = 45724;
UPDATE creature SET position_x = 10.453961, position_y = -231.321625, position_z = -77.228943, spawndist = 5, MovementType = 1 WHERE guid = 87105;
UPDATE creature SET position_x = 38.975677, position_y = -164.936310, position_z = -82.935074, spawndist = 2, MovementType = 1 WHERE guid = 87113;
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (38116,38168,85963);
DELETE FROM creature_movement WHERE id IN (38116,38168,85963);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #38116 
(38116,1,-241.193,42.2694,-83.8524,0,0,3.15753,0,0),
(38116,2,-257.169,41.459,-86.9647,0,0,3.66727,0,0),
(38116,3,-268.754,32.5239,-87.9437,0,0,3.1882,0,0),
(38116,4,-279.79,33.354,-88.8636,0,0,2.70361,0,0),
(38116,5,-302.306,48.9864,-93.0104,0,0,2.86854,0,0),
(38116,6,-321.468,52.3916,-96.2298,0,0,3.42146,0,0),
(38116,7,-335.7,45.4104,-98.3198,0,0,4.00894,0,0),
(38116,8,-340.7,36.0533,-99.0784,0,0,4.69929,0,0),
(38116,9,-339.409,28.5987,-100.247,0,0,5.25928,0,0),
(38116,10,-332.995,21.5768,-103.176,0,0,5.70217,0,0),
(38116,11,-338.99,28.3312,-100.283,0,0,1.99666,0,0),
(38116,12,-340.614,36.4627,-99.0447,0,0,1.45787,0,0),
(38116,13,-335.639,46.0422,-98.2416,0,0,0.692109,0,0),
(38116,14,-322.301,52.3214,-96.3296,0,0,0.144241,0,0),
(38116,15,-302.867,49.2066,-93.0867,0,0,5.72843,0,0),
(38116,16,-280.559,33.8918,-88.9843,0,0,6.06065,0,0),
(38116,17,-269.405,32.6903,-87.9801,0,0,0.513374,0,0),
(38116,18,-256.297,40.9856,-86.9004,0,0,0.286394,0,0),
(38116,19,-241.16,42.102,-83.8425,0,0,0.329591,0,0),
(38116,20,-217.971,49.149,-82.2794,0,0,0.628828,0,0),
(38116,21,-207.092,59.329,-82.3576,0,0,0.997965,0,0),
(38116,22,-196.834,74.8148,-81.7144,0,0,0.661029,0,0),
(38116,23,-186.296,84.9382,-79.5481,0,0,0.424624,0,0),
(38116,24,-174.414,87.8771,-77.7629,0,0,6.19573,0,0),
(38116,25,-164.768,80.992,-76.0056,0,0,5.37342,0,0),
(38116,26,-147.974,53.8704,-75.8208,0,0,5.05691,0,0),
(38116,27,-141.957,42.629,-75.4675,0,0,4.98623,0,0),
(38116,28,-141.45,22.0252,-74.8123,0,0,4.63673,0,0),
(38116,29,-145.667,8.31579,-74.5782,0,0,4.39718,0,0),
(38116,30,-155.675,-14.5223,-78.0544,0,0,4.62495,0,0),
(38116,31,-153.295,-27.8904,-80.1074,0,0,5.36714,0,0),
(38116,32,-142.287,-38.5889,-78.8823,0,0,5.72842,0,0),
(38116,33,-152.379,-27.9155,-79.9458,0,0,2.06061,0,0),
(38116,34,-155.651,-14.4576,-78.042,0,0,1.38988,0,0),
(38116,35,-145.77,7.76751,-74.5628,0,0,1.27992,0,0),
(38116,36,-145.77,7.76751,-74.5628,0,0,1.27992,0,0),
(38116,37,-142.01,35.0579,-75.3986,0,0,1.81321,0,0),
(38116,38,-143.771,45.6428,-75.3807,0,0,2.06454,0,0),
(38116,39,-153.842,59.4346,-75.6966,0,0,2.13915,0,0),
(38116,40,-164.62,80.9623,-76.0071,0,0,2.30251,0,0),
(38116,41,-175.641,87.215,-78.0969,0,0,3.05964,0,0),
(38116,42,-184.698,85.9708,-79.4345,0,0,3.53637,0,0),
(38116,43,-197.63,74.554,-81.7961,0,0,4.0783,0,0),
(38116,44,-217.403,50.4437,-82.285,0,0,3.8199,0,0),
-- #38168
(38168,1,-163.207,-96.9781,-66.663,0,0,5.75562,0,0),
(38168,2,-147.497,-101.802,-68.5947,0,0,6.27759,0,0),
(38168,3,-128.496,-102.5,-71.5074,0,0,0.273224,0,0),
(38168,4,-120.008,-95.097,-72.086,0,0,1.09868,0,0),
(38168,5,-115.215,-75.2305,-69.3508,0,0,1.11831,0,0),
(38168,6,-98.7366,-61.618,-67.1226,0,0,0.615658,0,0),
(38168,7,-72.1005,-51.2044,-61.7233,0,0,0.391819,0,0),
(38168,8,-99.5672,-62.2831,-67.2459,0,0,3.79332,0,0),
(38168,9,-114.608,-75.3549,-69.5214,0,0,4.17816,0,0),
(38168,10,-120.449,-94.6039,-71.8979,0,0,4.03522,0,0),
(38168,11,-128.759,-102.215,-71.4281,0,0,3.4933,0,0),
(38168,12,-147.378,-101.769,-68.6083,0,0,3.06918,0,0),
(38168,13,-162.921,-96.9254,-66.6689,0,0,2.53511,0,0),
(38168,14,-172.51,-86.2992,-67.6991,0,0,1.85339,0,0),
(38168,15,-173.39,-74.8943,-68.2057,0,0,1.44733,0,0),
(38168,16,-172.706,-85.6673,-67.6947,0,0,4.96198,0,0),
-- #85963
(85963,1,29.286,-162.936,-81.8688,0,0,4.85667,0,0),
(85963,2,28.182,-173.572,-83.5399,0,0,4.28255,0,0),
(85963,3,16.1552,-183.5,-83.0248,0,0,3.66994,0,0),
(85963,4,-1.6968,-185.095,-80.7507,0,0,4.15375,0,0),
(85963,5,-6.77331,-200.482,-79.1849,0,0,4.70968,0,0),
(85963,6,-3.68555,-216.02,-75.899,0,0,4.89582,0,0),
(85963,7,-7.23298,-228.119,-73.028,0,0,4.25965,0,0),
(85963,8,-26.7252,-246.039,-68.2434,0,0,3.64704,0,0),
(85963,9,-7.8933,-228.985,-72.7269,0,0,1.11885,0,0),
(85963,10,-3.70738,-216.133,-75.8558,0,0,1.5783,0,0),
(85963,11,-6.38523,-200.621,-79.2912,0,0,1.58245,0,0),
(85963,12,-0.725946,-186.789,-80.8895,0,0,0.565363,0,0),
(85963,13,14.953,-183.662,-82.9322,0,0,0.418483,0,0),
(85963,14,28.237,-173.451,-83.5226,0,0,1.16449,0,0),
(85963,15,29.3999,-163.131,-81.9668,0,0,2.06298,0,0),
(85963,16,23.2016,-152.043,-78.9337,0,0,2.38131,0,0),
(85963,17,2.10258,-137.804,-76.5998,0,0,2.62086,0,0),
(85963,18,-30.1591,-123.821,-72.1101,0,0,2.78187,0,0),
(85963,19,1.53461,-137.419,-76.5367,0,0,5.71297,0,0),
(85963,20,22.1765,-150.683,-78.5273,0,0,5.65799,0,0);

-- Druid of the Fang
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 85948;
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE guid = 85919;
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE guid = 87122;
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE guid = 18682;
UPDATE creature SET position_x = -341.693024, position_y = -112.663597, position_z = -63.787231, spawndist = 5, MovementType = 1 WHERE guid = 87150;
UPDATE creature SET position_x = -214.287292, position_y = 46.809830, position_z = -82.261520, spawndist = 5, MovementType = 1 WHERE guid = 33987;
UPDATE creature SET position_x = -176.696625, position_y = -92.646103, position_z = -67.163155, spawndist = 5, MovementType = 1 WHERE guid = 45722;
UPDATE creature SET position_x = -329.414398, position_y = -84.181580, position_z = -65.576790, spawndist = 5, MovementType = 1 WHERE guid = 87153;

-- Evolving Ectoplasm
UPDATE creature SET position_x = -110.559517, position_y = -260.382935, position_z = -57.422146, orientation = 2.382781 WHERE guid = 86047;
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid IN (38142,86047,87157);
DELETE FROM creature_movement WHERE id IN (38142,86047,87157);
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
-- #38142
(38142,1,-350.974,31.0695,-100.592,0,0,1.7402,0,0),
(38142,2,-351.788,41.0876,-100.147,0,0,1.43783,0,0),
(38142,3,-347.339,49.4633,-99.1387,0,0,0.68879,0,0),
(38142,4,-336.402,53.256,-97.9688,0,0,0.103668,0,0),
(38142,5,-312.729,50.5003,-94.6583,0,0,6.13945,0,0),
(38142,6,-291.86,46.1814,-91.512,0,0,5.79781,0,0),
(38142,7,-280.678,36.3304,-89.1863,0,0,5.97295,0,0),
(38142,8,-263.52,36.9492,-87.3749,0,0,0.166829,0,0),
(38142,9,-238.667,41.2443,-83.4696,0,0,6.01412,0,0),
(38142,10,-220.935,35.1547,-82.4884,0,0,0.387526,0,0),
(38142,11,-198.897,58.9616,-82.4193,0,0,1.17271,0,0),
(38142,12,-195.385,75.752,-81.5061,0,0,1.17899,0,0),
(38142,13,-183.378,88.3891,-79.3061,0,0,0.289136,0,0),
(38142,14,-171.484,91.2173,-77.3679,0,0,5.97306,0,0),
(38142,15,-163.106,85.5603,-75.9694,0,0,5.50183,0,0),
(38142,16,-151.344,64.7209,-75.8932,0,0,5.16647,0,0),
(38142,17,-143.995,38.4453,-75.6764,0,0,4.95048,0,0),
(38142,18,-139.451,5.96934,-74.4381,0,0,4.87195,0,0),
(38142,19,-134.782,-33.7224,-77.1659,0,0,4.52323,0,0),
(38142,20,-136.786,-44.3986,-78.842,0,0,4.30096,0,0),
(38142,21,-141.118,-49.3827,-78.7078,0,0,3.70014,0,0),
(38142,22,-149.677,-55.6208,-77.09,0,0,3.54306,0,0),
(38142,23,-171.933,-61.6922,-72.176,0,0,3.44881,0,0),
(38142,24,-149.235,-55.7584,-77.1013,0,0,0.516917,0,0),
(38142,25,-140.16,-49.1157,-78.7086,0,0,0.874273,0,0),
(38142,26,-135.532,-41.8277,-78.5371,0,0,1.28959,0,0),
(38142,27,-134.492,-32.9108,-77.1015,0,0,1.56632,0,0),
(38142,28,-136.449,-16.7871,-76.3314,0,0,1.71555,0,0),
(38142,29,-139.388,5.44889,-74.552,0,0,1.65664,0,0),
(38142,30,-143.965,38.5244,-75.6675,0,0,1.75089,0,0),
(38142,31,-151.563,64.9649,-75.8898,0,0,2.04542,0,0),
(38142,32,-163.332,85.8414,-75.9659,0,0,2.34387,0,0),
(38142,33,-172.358,91.2293,-77.5342,0,0,2.82432,0,0),
(38142,34,-180.071,90.9801,-78.9868,0,0,3.433,0,0),
(38142,35,-195.65,75.7468,-81.5234,0,0,4.24588,0,0),
(38142,36,-201.077,52.6642,-82.1164,0,0,4.11001,0,0),
(38142,37,-221.619,35.6366,-82.3932,0,0,3.20288,0,0),
(38142,38,-229.538,37.0909,-82.3751,0,0,2.7929,0,0),
(38142,39,-238.57,41.3212,-83.4619,0,0,3.06622,0,0),
(38142,40,-263.201,36.9681,-87.3377,0,0,3.32882,0,0),
(38142,41,-281.6,36.9127,-89.3543,0,0,2.63767,0,0),
(38142,42,-292.172,46.6155,-91.5915,0,0,2.75941,0,0),
(38142,43,-312.89,50.7145,-94.6917,0,0,3.08535,0,0),
(38142,44,-336.385,53.0905,-97.954,0,0,3.24243,0,0),
(38142,45,-346.969,49.7175,-99.0876,0,0,3.7765,0,0),
(38142,46,-349.946,46.301,-99.6044,0,0,4.21298,0,0),
(38142,47,-351.877,39.3114,-100.228,0,0,4.80281,0,0),
(38142,48,-350.779,30.2739,-100.625,0,0,5.33844,0,0),
(38142,49,-339.655,21.6589,-101.701,0,0,5.9214,0,0),
(38142,50,-313.309,14.4102,-106.172,0,0,6.05099,0,0),
(38142,51,-293.229,12.7872,-105.805,0,0,6.25519,0,0),
(38142,52,-315.887,15.0052,-106.098,0,0,2.96515,0,0),
(38142,53,-340.819,22.63,-101.44,0,0,2.72168,0,0),
-- #86047
(86047,1,-92.1335,-263.5,-55.1471,0,0,6.02698,0,0),
(86047,2,-106.231,-261.353,-56.7172,0,0,2.73224,0,0),
(86047,3,-120.101,-253.275,-60.6152,0,0,2.38902,0,0),
(86047,4,-139.359,-231.038,-69.0037,0,0,2.36938,0,0),
(86047,5,-151.376,-220.705,-71.1936,0,0,2.18795,0,0),
(86047,6,-153.009,-209.864,-69.7622,0,0,1.62639,0,0),
(86047,7,-146.822,-194.599,-67.9765,0,0,1.1473,0,0),
(86047,8,-136.908,-184.485,-67.9747,0,0,0.695698,0,0),
(86047,9,-123.475,-183.161,-68.5726,0,0,0.032036,0,0),
(86047,10,-100.027,-189.878,-69.2976,0,0,5.88011,0,0),
(86047,11,-92.9727,-197.987,-69.0403,0,0,5.06173,0,0),
(86047,12,-86.1435,-234.91,-67.3263,0,0,4.72008,0,0),
(86047,13,-88.5791,-206.593,-68.7181,0,0,2.01046,0,0),
(86047,14,-93.7853,-193.261,-69.1191,0,0,2.56024,0,0),
(86047,15,-109.382,-186.175,-68.2055,0,0,2.86654,0,0),
(86047,16,-129.302,-182.523,-68.2975,0,0,3.0786,0,0),
(86047,17,-140.864,-187.701,-68.3682,0,0,3.7776,0,0),
(86047,18,-150.024,-201.89,-68.2674,0,0,4.31167,0,0),
(86047,19,-152.654,-214.459,-70.5901,0,0,4.90542,0,0),
(86047,20,-146.049,-226.086,-70.5659,0,0,5.36488,0,0),
(86047,21,-130.668,-237.694,-65.8215,0,0,5.60049,0,0),
(86047,22,-120.01,-253.226,-60.5953,0,0,5.33346,0,0),
(86047,23,-111.762,-260.232,-57.7123,0,0,5.89501,0,0),
-- #87157
(87157,1,-363.202,-124.745,-64.5286,0,0,5.37462,0,0),
(87157,2,-351.567,-139.68,-62.6226,0,0,5.55212,0,0),
(87157,3,-336.065,-152.713,-62.5707,0,0,5.90241,0,0),
(87157,4,-322.947,-155.601,-61.6374,0,0,0.110092,0,0),
(87157,5,-312.726,-146.397,-61.6134,0,0,1.05257,0,0),
(87157,6,-307.947,-129.021,-61.4873,0,0,1.37458,0,0),
(87157,7,-303.853,-114.418,-63.221,0,0,0.85622,0,0),
(87157,8,-300.46,-104.332,-63.9405,0,0,1.73508,0,0),
(87157,9,-307.52,-87.7816,-64.5265,0,0,2.2613,0,0),
(87157,10,-316.789,-74.3077,-64.6553,0,0,2.0139,0,0),
(87157,11,-318.486,-57.8479,-64.3392,0,0,1.61334,0,0),
(87157,12,-299.255,-27.578,-60.9011,0,0,1.07613,0,0),
(87157,13,-296.014,-16.0174,-59.9064,0,0,2.13956,0,0),
(87157,14,-301.692,-15.5349,-59.7131,0,0,3.91149,0,0),
(87157,15,-310.984,-28.9368,-60.89,0,0,3.86515,0,0),
(87157,16,-326.361,-35.7607,-63.2927,0,0,3.66802,0,0),
(87157,17,-341.033,-53.6849,-64.2189,0,0,4.08271,0,0),
(87157,18,-354.261,-77.6512,-65.5206,0,0,4.23586,0,0),
(87157,19,-362.873,-94.2526,-65.9622,0,0,4.02144,0,0),
(87157,20,-373.72,-100.064,-65.2587,0,0,4.11177,0,0);

-- Deviate Dreadfang / Venomwing
UPDATE creature SET position_x = -216.087051, position_y = -326.585144, position_z = -71.001495, spawndist = 10, MovementType = 1 WHERE guid = 87132;
UPDATE creature SET position_x = -360.120270, position_y = -117.154121, position_z = -64.733063, spawndist = 5, MovementType = 1 WHERE guid = 87156;
UPDATE creature SET position_x = -248.955383, position_y = -216.704453, position_z = -63.100262, spawndist = 5, MovementType = 1 WHERE guid = 87130;
UPDATE creature SET spawndist = 0, movementType = 2 WHERE guid = 38122;
DELETE FROM creature_movement WHERE id = 38122;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(38122,1,-208.549,58.0016,-49.601,0,0,6.06974,0,0),
(38122,2,-203.835,54.7533,-49.2746,0,0,5.43749,0,0),
(38122,3,-199.685,46.4123,-48.9119,0,0,5.21208,0,0),
(38122,4,-197.392,41.2041,-48.6779,0,0,5.93308,0,0),
(38122,5,-192.449,41.5195,-47.8548,0,0,0.744733,0,0),
(38122,6,-179.34,54.9077,-43.814,0,0,1.23011,0,0),
(38122,7,-177.227,63.0098,-43.5805,0,0,1.74062,0,0),
(38122,8,-182.851,69.7657,-45.6939,0,0,2.64618,0,0),
(38122,9,-193.14,70.3026,-47.7897,0,0,3.75202,0,0),
(38122,10,-196.643,63.5984,-48.3302,0,0,4.56491,0,0),
(38122,11,-189.152,56.1746,-47.3711,0,0,5.96683,0,0),
(38122,12,-174.955,55.8997,-42.2382,0,0,6.19852,0,0),
(38122,13,-165.256,50.6814,-39.4577,0,0,5.64874,0,0),
(38122,14,-157.318,42.6426,-35.5535,0,0,5.36208,0,0),
(38122,15,-153.533,37.0276,-32.6655,0,0,5.28354,0,0),
(38122,16,-146.112,23.6438,-28.4371,0,0,5.20107,0,0),
(38122,17,-153.574,37.4096,-32.7856,0,0,2.18094,0,0),
(38122,18,-157.071,42.8507,-35.5542,0,0,2.33881,0,0),
(38122,19,-164.853,50.4357,-39.3263,0,0,2.44484,0,0),
(38122,20,-175.119,55.5717,-42.3054,0,0,3.19297,0,0),
(38122,21,-185.059,55.6917,-46.2679,0,0,3.06103,0,0),
(38122,22,-193.243,58.1374,-48.1044,0,0,2.56544,0,0),
(38122,23,-196.708,63.5264,-48.3384,0,0,1.69443,0,0),
(38122,24,-194.343,68.5748,-47.9196,0,0,0.840706,0,0),
(38122,25,-188.65,71.3681,-47.0857,0,0,0.275219,0,0),
(38122,26,-182.183,69.6568,-45.4077,0,0,5.82799,0,0),
(38122,27,-177.402,63.6642,-43.6598,0,0,4.94835,0,0),
(38122,28,-179.533,54.5513,-43.8893,0,0,4.10876,0,0),
(38122,29,-190.949,42.8993,-47.4698,0,0,3.55742,0,0),
(38122,30,-198.366,42.2613,-48.7994,0,0,2.89297,0,0),
(38122,31,-201.596,51.2377,-49.1721,0,0,1.96227,0,0),
(38122,32,-205.358,57.1103,-49.3369,0,0,2.71233,0,0),
(38122,33,-211.604,58.3914,-49.856,0,0,3.32268,0,0),
(38122,34,-220.119,58.1735,-49.0032,0,0,2.96791,0,0),
(38122,35,-230.435,59.9715,-49.5928,0,0,3.21346,0,0),
(38122,36,-245.867,58.3075,-51.8376,0,0,3.44123,0,0),
(38122,37,-262.987,52.1493,-54.1098,0,0,3.66507,0,0),
(38122,38,-269.738,46.4245,-54.6324,0,0,4.3837,0,0),
(38122,39,-272.867,29.4482,-59.3862,0,0,4.54471,0,0),
(38122,40,-276.413,17.8821,-61.3901,0,0,4.27375,0,0),
(38122,41,-273.023,29.1812,-59.436,0,0,1.28924,0,0),
(38122,42,-269.989,46.11,-54.7535,0,0,0.975077,0,0),
(38122,43,-262.959,52.3755,-54.0855,0,0,0.485774,0,0),
(38122,44,-245.125,58.3236,-51.7314,0,0,0.104855,0,0),
(38122,45,-234.488,59.2599,-50.0718,0,0,6.25131,0,0),
(38122,46,-220.257,58.488,-49.0034,0,0,6.26701,0,0);







