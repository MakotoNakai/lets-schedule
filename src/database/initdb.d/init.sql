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

create table if not exists user_meetings (
  `id` bigint(11) not null auto_increment,
  `user_id` bigint(11) not null,
  `meeting_id` bigint(11) not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null default current_timestamp on update current_timestamp,
  primary key(id)
);
insert into user_meetings values (1, 1, 1, current_timestamp, current_timestamp);
insert into user_meetings values (2, 1, 2, current_timestamp, current_timestamp);
insert into user_meetings values (3, 2, 3, current_timestamp, current_timestamp);
insert into user_meetings values (4, 1, 3, current_timestamp, current_timestamp);
insert into user_meetings values (5, 2, 4, current_timestamp, current_timestamp);
insert into user_meetings values (6, 1, 4, current_timestamp, current_timestamp);
insert into user_meetings values (7, 2, 5, current_timestamp, current_timestamp);
insert into user_meetings values (8, 1, 5, current_timestamp, current_timestamp);


create table if not exists participants (
  `user_meeting_id` bigint(11) not null,
  `is_host` boolean not null,
  `has_responded` boolean not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null default current_timestamp on update current_timestamp,
  primary key(user_meeting_id)
);

insert into participants values (1, 1, 1, current_timestamp, current_timestamp);
insert into participants values (2, 1, 1, current_timestamp, current_timestamp);
insert into participants values (3, 1, 1, current_timestamp, current_timestamp);
insert into participants values (4, 0, 1, current_timestamp, current_timestamp);
insert into participants values (5, 1, 1, current_timestamp, current_timestamp);
insert into participants values (6, 0, 1, current_timestamp, current_timestamp);
insert into participants values (7, 0, 0, current_timestamp, current_timestamp);
insert into participants values (8, 0, 0, current_timestamp, current_timestamp);

create table if not exists user_times (
  `user_meeting_id` bigint(11) not null, 
  `candidate_time_id` bigint(11) not null ,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null default current_timestamp on update current_timestamp,
  primary key(user_meeting_id, candidate_time_id)
);

insert into user_times values (1, 1, current_timestamp, current_timestamp);
insert into user_times values (2, 2, current_timestamp, current_timestamp);
insert into user_times values (3, 3, current_timestamp, current_timestamp);
insert into user_times values (4, 4, current_timestamp, current_timestamp);
insert into user_times values (5, 5, current_timestamp, current_timestamp);
insert into user_times values (6, 6, current_timestamp, current_timestamp);
insert into user_times values (7, 7, current_timestamp, current_timestamp);
insert into user_times values (8, 8, current_timestamp, current_timestamp);


create table if not exists candidate_times (
  `id` bigint(11) not null auto_increment,
  `start_time` timestamp not null,
  `end_time` timestamp not null,
  `created_at` timestamp not null default current_timestamp,
  `updated_at` timestamp not null default current_timestamp on update current_timestamp,
  primary key(id)
);

insert into candidate_times values (1, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
insert into candidate_times values (2, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
insert into candidate_times values (3, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
insert into candidate_times values (4, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
insert into candidate_times values (5, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
insert into candidate_times values (6, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
insert into candidate_times values (7, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
insert into candidate_times values (8, current_timestamp, current_timestamp, current_timestamp, current_timestamp);
