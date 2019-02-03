CREATE EXTENSION intarray;

-- not sure if those indexes help ;-)
create index idx_colour on osm_routes (colour);
create index idx_symbol on osm_routes ("osmc:symbol");
create index idx_network on osm_routes (network);
create index idx_type on osm_routes (type);

drop table if exists zindex;
create table zindex (type varchar primary key, z serial);
insert into zindex (type) values
('guidepost'),
('tower_observation'),
('cave_entrance'),
('monument'),
('office'),
('hotel'),
('chalet'),
('hostel'),
('motel'),
('guest_house'),
('alpine_hut'),
('camp_site'),
('castle'),
('hut'),
('cabin'),
('church'),
('chapel'),
('cathedral'),
('temple'),
('basilica'),
('shelter'),
('museum'),
('cinema'),
('theatre'),
('bunker'),
('restaurant'),
('pub'),
('convenience'),
('supermarket'),
('fuel'),
('fast_food'),
('cafe'),
('confectionery'),
('hospital'),
('pharmacy'),
('waterfall'),
('spring'),
('viewpoint'),
('mine'),
('adit'),
('mineshaft'),
('townhall'),
('memorial'),
('hunting_stand'),
('board'),
('map'),
('artwork'),
('fountain'),
('community_centre'),
('fire_station'),
('police'),
('post_office'),
('wayside_shrine'),
('wayside_cross'),
('cross'),
('rock'),
('stone'),
('toilets'),
('post_box'),
('telephone'),
('attraction'),
('tower_communication'),
('mast_communication'),
('tower_other'),
('mast_other'),
('peak'),
('firepit'),
('waste_basket'),
('waste_disposal'),
('lift_gate'),
('feeding_place'),
('game_feedng'),
('gate');
