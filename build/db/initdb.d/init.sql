create table if not exists users (
  `id` bigint(11) not null auto_increment,
  `user_name` varchar(191) not null,
  `email_address` varchar(191) not null,
  `password` varchar(191) not null,
  `is_admin` boolean,
  `can_login` boolean,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null default current_timestamp on update current_timestamp,
  primary key(id)
);

insert into users values (1, "makoto", "makoto@email.com", "password", 1, 1, current_timestamp, current_timestamp);
insert into users values (2, "minoru", "minoru@email.com", "password", 1, 1, current_timestamp, current_timestamp);


create table if not exists meetings (
  `id` bigint(11) not null auto_increment,
  `title` varchar(191) not null,
  `description` text,
  `type` varchar(191),
  `place` varchar(191),
  `url` varchar(191),
  `is_confirmed` boolean not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null default current_timestamp on update current_timestamp,
  primary key(id)
);

insert into meetings values (1, "meeting1", " description1", "hybrid", "place1", "http://meeting1-zoom.com", 1, current_timestamp, current_timestamp);
insert into meetings values (2, "meeting2", "description2", "physical", "place2", "", 0, current_timestamp, current_timestamp);
insert into meetings values (3, "meeting3", "description3", "virtual", "", "http://meeting3-zoom.com", 1, current_timestamp, current_timestamp);
insert into meetings values (4, "meeting4", "description4", "hybrid", "place4", "http://meeting4-zoom.com", 0, current_timestamp, current_timestamp);
insert into meetings values (5, "meeting5", "description5", "hybrid", "place5", "http://meeting5-zoom.com", 0, current_timestamp, current_timestamp);


create table if not exists participants (
  `id` bigint(11) not null auto_increment,
  `meeting_id` bigint(11) not null,
  `user_id` bigint(11) not null,
  `is_host` boolean not null,
  `has_responded` boolean not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null default current_timestamp on update current_timestamp,
  primary key(id)
);

insert into participants values (1, 1, 1, 1, 1, current_timestamp, current_timestamp);
insert into participants values (2, 2, 1, 1, 1, current_timestamp, current_timestamp);
insert into participants values (3, 3, 2, 1, 1, current_timestamp, current_timestamp);
insert into participants values (4, 3, 1, 0, 1, current_timestamp, current_timestamp);
insert into participants values (5, 4, 2, 1, 1, current_timestamp, current_timestamp);
insert into participants values (6, 4, 1, 0, 1, current_timestamp, current_timestamp);
insert into participants values (7, 5, 2, 0, 0, current_timestamp, current_timestamp);
insert into participants values (8, 5, 1, 0, 0, current_timestamp, current_timestamp);


create table if not exists candidate_times (
  `id` bigint(11) not null auto_increment,
  `meeting_id` bigint(11) not null,
  `user_id` bigint(11) not null,
  `is_host` boolean not null,
  `has_responded` boolean not null,
  `start_time` timestamp not null,
  `end_time` timestamp not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null default current_timestamp on update current_timestamp,
  primary key(id)
);

insert into candidate_times values (1, 1, 1, 1, 1, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
insert into candidate_times values (2, 1, 2, 0, 0, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
