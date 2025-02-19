CREATE EXTENSION intarray;
CREATE EXTENSION hstore;

-- see https://wiki.postgresql.org/wiki/First/last_(aggregate)

-- Create a function that always returns the first non-NULL item
CREATE OR REPLACE FUNCTION public.first_agg ( anyelement, anyelement )
RETURNS anyelement LANGUAGE SQL IMMUTABLE STRICT AS $$
        SELECT $1;
$$;

-- And then wrap an aggregate around it
CREATE AGGREGATE public.FIRST (
        sfunc    = public.first_agg,
        basetype = anyelement,
        stype    = anyelement
);

-- Create a function that always returns the last non-NULL item
CREATE OR REPLACE FUNCTION public.last_agg ( anyelement, anyelement )
RETURNS anyelement LANGUAGE SQL IMMUTABLE STRICT AS $$
        SELECT $2;
$$;

-- And then wrap an aggregate around it
CREATE AGGREGATE public.LAST (
        sfunc    = public.last_agg,
        basetype = anyelement,
        stype    = anyelement
);

-- not sure if those indexes help ;-)
create index idx_colour on osm_routes (colour);
create index idx_symbol on osm_routes ("osmc:symbol");
create index idx_network on osm_routes (network);
create index idx_type on osm_routes (type);

create index osm_features_osm_id on osm_features (osm_id);
create index osm_features_type on osm_features (type);
create index osm_places_type on osm_places (type);


drop table if exists z_order_poi;
create table z_order_poi (type varchar primary key, z_order serial);
insert into z_order_poi (type) values
('monument'),
('archaeological_site'),
('tower_observation'),
('cave_entrance'),
('arch'),
('office'),
('water_park'),
('hotel'),
('chalet'),
('hostel'),
('motel'),
('guest_house'),
('alpine_hut'),
('apartment'),
('wilderness_hut'),
('basic_hut'),
('camp_site'),
('castle'),
('forester''s_lodge'),
('guidepost'),
('cathedral'),
('temple'),
('basilica'),
('church'),
('chapel'),
('station'),
('halt'),
('bus_station'),
('museum'),
('cinema'),
('theatre'),
('free_flying'),
('bunker'),
('restaurant'),
('pub'),
('convenience'),
('supermarket'),
('fuel'),
('fast_food'),
('cafe'),
('bar'),
('pastry'),
('confectionery'),
('hospital'),
('pharmacy'),
('golf_course'),
('miniature_golf'),
('soccer'),
('tennis'),
('basketball'),
('waterfall'),
('dam'),
('weir'),
('refitted_drinking_spring'),
('drinking_spring'),
('refitted_spring'),
('spring'),
('refitted_not_drinking_spring'),
('not_drinking_spring'),
('drinking_water'),
('hot_spring'),
('water_point'),
('water_well'),
('viewpoint'),
('mine'),
('adit'),
('mineshaft'),
('disused_mine'),
('townhall'),
('memorial'),
('university'),
('college'),
('school'),
('kindergarten'),
('community_centre'),
('fire_station'),
('police'),
('post_office'),
('horse_riding'),
('picnic_shelter'),
('weather_shelter'),
('shelter'),
('lean_to'),
('hunting_stand'),
('taxi'),
('bus_stop'),
('public_transport'),
('tower_bell_tower'),
('bicycle'),
('board'),
('map'),
('artwork'),
('fountain'),
('playground'),
('wayside_shrine'),
('cross'),
('wayside_cross'),
('tree_shrine'),
('rock'),
('stone'),
('sinkhole'),
('toilets'),
('post_box'),
('telephone'),
('chimney'),
('water_tower'),
('attraction'),
('sauna'),
('tower_communication'),
('mast_communication'),
('tower_other'),
('mast_other'),
('saddle'),
('peak1'),
('peak2'),
('peak3'),
('peak'),
('water_works'),
('reservoir_covered'),
('pumping_station'),
('wastewater_plant'),
('outdoor_seating'),
('firepit'),
('bench'),
('beehive'),
('waste_basket'),
('waste_disposal'),
('lift_gate'),
('swing_gate'),
('watering_place'),
('feeding_place'),
('game_feeding'),
('shopping_cart'),
('ruins'),
('building'),
('tree'),
('gate'),
('ford'),
('route_marker');
