CREATE TYPE public.account_type AS ENUM ('Client', 'Employee', 'Admin');
ALTER TYPE public.account_type OWNER TO cse340_mefix07;
--Table structure for table 'classification'
CREATE TABLE public.classification (
    classification_id INT GENERATED BY DEFAULT AS IDENTITY,
    classification_name CHARACTER VARYING NOT NULL,
    CONSTRAINT classification_pk PRIMARY KEY (classification_id)
);
--Table structure for table 'inventory'
CREATE TABLE IF NOT EXISTS public.inventory (
    inv_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    inv_make character varying NOT NULL,
    inv_model character varying NOT NULL,
    inv_year character(4) NOT NULL,
    inv_description text NOT NULL,
    inv_image character varying NOT NULL,
    inv_thumbnail character varying NOT NULL,
    inv_price numeric(9, 0) NOT NULL,
    inv_miles integer NOT NULL,
    inv_color character varying NOT NULL,
    classification_id integer NOT NULL,
    CONSTRAINT inventory_pkey PRIMARY KEY (inv_id)
);
--Create relationship between 'classification' and 'inventory' tables
ALTER TABLE IF EXISTS public.inventory
ADD CONSTRAINT fk_classification FOREIGN KEY (classification_id) REFERENCES public.classification (classification_id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE NO ACTION;
-- Table structure for table `account`
CREATE TABLE IF NOT EXISTS public.account (
    account_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    account_firstname character varying NOT NULL,
    account_lastname character varying NOT NULL,
    account_email character varying NOT NULL,
    account_password character varying NOT NULL,
    account_type account_type NOT NULL DEFAULT 'Client'::account_type,
    CONSTRAINT account_pkey PRIMARY KEY (account_id)
);
-- Data for table 'classification'
INSERT INTO public.classification (classification_name)
VALUES ('Custom'),
    ('Sport'),
    ('SUV'),
    ('Truck'),
    ('Sedan');
-- Data for table `inventory`
INSERT INTO public.inventory (
        inv_make,
        inv_model,
        inv_year,
        inv_description,
        inv_image,
        inv_thumbnail,
        inv_price,
        inv_miles,
        inv_color,
        classification_id
    )
VALUES (
        'Chevy',
        'Camaro',
        '2018',
        'If you want to look cool this is the ar you need! This car has great performance at an affordable price. Own it today!',
        '/images/vehicles/camaro.jpg',
        '/images/vehicles/camaro-tn.jpg',
        25000,
        101222,
        'Silver',
        2
    ),
    (
        'Batmobile',
        'Custom',
        '2007',
        'Ever want to be a super hero? now you can with the batmobile. This car allows you to switch to bike mode allowing you to easily maneuver through traffic during rush hour.',
        '/image/vehicles/batmobile.jpg',
        '/image/vehicles/batmobile-tn.jpg',
        65000,
        29887,
        'Black',
        1
    ),
    (
        'FBI',
        'Surveillance Van',
        '2016',
        'Do you like police shows? You will feel right at home driving this van, comes complete with survalence equipments for and extra fee of $2,000 a month.',
        '/image/vehicles/survan.jpg',
        '/image/vehicles/survan-tn.jpg',
        20000,
        19851,
        'Brown',
        1
    ),
    (
        'Dog ',
        'Car',
        '1997',
        'Do you like dogs? Well this car is for you straight from the 90s from Aspen, Colorado we have the orginal Dog Car complete with fluffy ears.',
        '/image/vehicles/dog-car.jpg',
        '/image/vehicles/dog-car-tn.jpg',
        35000,
        71632,
        'White',
        1
    ),
    (
        'Jeep',
        'Wrangler',
        '2019',
        'The Jeep Wrangler is small and compact with enough power to get you where you want to go. Its great for everyday driving as well as offroading weather that be on the the rocks or in the mud!',
        '/image/vehicles/wrangler.jpg',
        '/image/vehicles/wrangler-tn.jpg',
        28045,
        41205,
        'Yellow',
        3
    ),
    (
        'Lamborghini',
        'Adventador',
        '2016',
        'This V-12 engine packs a punch in this sporty car. Make sure you wear your seatbelt and obey all traffic laws. ',
        '/image/vehicles/adventador.jpg',
        '/image/vehicles/adventador-tn.jpg',
        417650,
        71003,
        'Blue',
        2
    ),
    (
        'Aerocar International',
        'Aerocar',
        '1963',
        'Are you sick of rushhour trafic? This car converts into an airplane to get you where you are going fast. Only 6 of these were made, get them while they last!',
        '/image/vehicles/aerocar.jpg',
        '/image/vehicles/aerocar-tn.jpg',
        700000,
        18956,
        'Red',
        1
    ),
    (
        'Monster',
        'Truck',
        '1995',
        'Most trucks are for working, this one is for fun. This beast comes with 60 inch tires giving you traction needed to jump and roll in the mud.',
        '/image/vehicles/monster-truck.jpg',
        '/image/vehicles/monster-truck-tn.jpg',
        150000,
        3998,
        'purple',
        1
    ),
    (
        'Cadillac',
        'Escalade',
        '2019',
        'This stylin car is great for any occasion from going to the beach to meeting the president. The luxurious inside makes this car a home away from home.',
        '/image/vehicles/escalade.jpg',
        '/image/vehicles/escalade-tn.jpg',
        75195,
        41958,
        'Black',
        4
    ),
    (
        'GM',
        'Hummer',
        '2016',
        'Do you have 6 kids and like to go offroading? The Hummer gives you the a huge interior with an engine to get you out of any muddy or rocky situation.',
        '/image/vehicles/hummer.jpg',
        '/image/vehicles/hummer-tn.jpg',
        58800,
        56564,
        'Yellow',
        4
    ),
    (
        'Mechanic',
        'Special',
        '1964',
        'Not sure where this car came from. however with a little tlc it will run as good a new.',
        '/image/vehicles/mechanic.jpg',
        '/image/vehicles/mechanic-tn.jpg',
        100,
        200125,
        'Rust',
        5
    ),
    (
        'Ford',
        'Model T',
        '1921',
        'The Ford Model T can be a bit tricky to drive. It was the first car to be put into production. You can get it in any color you want as long as it is black.',
        '/image/vehicles/model-t.jpg',
        '/image/vehicles/model-t-tn.jpg',
        30000,
        26357,
        'Black',
        5
    ),
    (
        'Mystery',
        'Machine',
        '1999',
        'Scooby and the gang always found luck in solving their mysteries because of there 4 wheel drive Mystery Machine. This Van will help you do whatever job you are required to with a success rate of 100%.',
        '/image/vehicles/mystery-van.jpg',
        '/image/vehicles/mystery-van-tn.jpg',
        10000,
        128564,
        'Green',
        1
    ),
    (
        'Spartan',
        'Fire Truck',
        '2012',
        'Emergencies happen often. Be prepared with this Spartan fire truck. Comes complete with 1000 ft. of hose and a 1000 gallon tank.',
        '/image/vehicles/fire-truck.jpg',
        '/image/vehicles/fire-truck-tn.jpg',
        50000,
        38522,
        'Red',
        4
    ),
    (
        'Ford',
        'Crown Victoria',
        '2013',
        'After the police force updated their fleet these cars are now available to the public! These cars come equiped with the siren which is convenient for college students running late to class.',
        '/image/vehicles/crwn-vic.jpg',
        '/image/vehicles/crwn-vic-tn.jpg',
        10000,
        108247,
        'White',
        5
    );
--update data on table 'inventory'
UPDATE public.inventory
SET inv_description = REPLACE(
        inv_description,
        'small interiors',
        'a huge interior'
    )
WHERE inv_make = 'GM';
-- Update data on table 'inventory' to show /vehicle on the inv_image and inv_thumbnail
UPDATE public.inventory
SET inv_image = REPLACE(inv_image, '/image', '/image/vehicle'),
    inv_thumbnail = REPLACE (inv_thumbnail, '/image', '/image/vehicle');