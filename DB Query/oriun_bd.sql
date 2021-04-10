/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/04/2021 9:21:46 p. m.                      */
/*==============================================================*/


drop table if exists element;

drop table if exists event;

drop table if exists locationsibu;

drop table if exists location_sport;

drop table if exists location_sports_sports;

drop table if exists notifications;

drop table if exists roles;

drop table if exists sports;

drop table if exists user;

drop table if exists user_event;

drop table if exists user_sports;

/*==============================================================*/
/* Table: element                                               */
/*==============================================================*/
create table element
(
   id_element           int not null auto_increment,
   name_location        varchar(50) not null,
   name_sport           varchar(50) not null,
   description          varchar(50) not null,
   available            bool not null,
   element_name         varchar(50) not null,
   element_image        longblob not null,
   primary key (id_element)
);

/*==============================================================*/
/* Table: event                                                 */
/*==============================================================*/
create table event
(
   id_event             int not null auto_increment,
   user_name            varchar(50) not null,
   name_loc_sport       varchar(50) not null,
   name_sport           varchar(50),
   event_description    varchar(100) not null,
   event_init           date not null,
   event_end            date not null,
   capacity             numeric(8,0) not null,
   other_sport          varchar(50),
   event_init_hour      time not null,
   event_finish_hour    time not null,
   event_title          varchar(50) not null,
   primary key (id_event)
);

/*==============================================================*/
/* Table: locationsibu                                          */
/*==============================================================*/
create table locationsibu
(
   name_location        varchar(50) not null,
   open                 bool not null,
   image_location       longblob not null,
   primary key (name_location)
);

/*==============================================================*/
/* Table: location_sport                                        */
/*==============================================================*/
create table location_sport
(
   name_loc_sport       varchar(50) not null,
   primary key (name_loc_sport)
);

/*==============================================================*/
/* Table: location_sports_sports                                */
/*==============================================================*/
create table location_sports_sports
(
   name_loc_sport       varchar(50) not null,
   name_sport           varchar(50) not null,
   primary key (name_loc_sport, name_sport)
);

/*==============================================================*/
/* Table: notifications                                         */
/*==============================================================*/
create table notifications
(
   id_notification      int not null auto_increment,
   user_name            varchar(50) not null,
   name_sport           varchar(50) not null,
   id_event             int not null,
   motification_date    date not null,
   time_notification    time not null,
   expiration_time      time not null,
   notifiaction_description varchar(80) not null,
   primary key (id_notification)
);

/*==============================================================*/
/* Table: roles                                                 */
/*==============================================================*/
create table roles
(
   rol_name             varchar(50) not null,
   primary key (rol_name)
);

/*==============================================================*/
/* Table: sports                                                */
/*==============================================================*/
create table sports
(
   name_sport           varchar(50) not null,
   primary key (name_sport)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_name            varchar(50) not null,
   rol_name             varchar(50) not null,
   password             varchar(50) not null,
   primary key (user_name)
);

/*==============================================================*/
/* Table: user_event                                            */
/*==============================================================*/
create table user_event
(
   user_name            varchar(50) not null,
   id_event             int not null,
   primary key (user_name, id_event)
);

/*==============================================================*/
/* Table: user_sports                                           */
/*==============================================================*/
create table user_sports
(
   user_name            varchar(50) not null,
   name_sport           varchar(50) not null,
   primary key (user_name, name_sport)
);

alter table element add constraint fk_element_lacation foreign key (name_location)
      references locationsibu (name_location) on delete restrict on update restrict;

alter table element add constraint fk_element_sports foreign key (name_sport)
      references sports (name_sport) on delete restrict on update restrict;

alter table event add constraint fk_create_event foreign key (user_name)
      references user (user_name) on delete restrict on update restrict;

alter table event add constraint fk_event_sports foreign key (name_sport)
      references sports (name_sport) on delete restrict on update restrict;

alter table event add constraint fk_location_sport_event foreign key (name_loc_sport)
      references location_sport (name_loc_sport) on delete restrict on update restrict;

alter table location_sports_sports add constraint fk_location_sports_sports foreign key (name_loc_sport)
      references location_sport (name_loc_sport) on delete restrict on update restrict;

alter table location_sports_sports add constraint fk_location_sports_sports2 foreign key (name_sport)
      references sports (name_sport) on delete restrict on update restrict;

alter table notifications add constraint fk_event_notification foreign key (id_event)
      references event (id_event) on delete restrict on update restrict;

alter table notifications add constraint fk_sports_notification foreign key (name_sport)
      references sports (name_sport) on delete restrict on update restrict;

alter table notifications add constraint fk_user_notification foreign key (user_name)
      references user (user_name) on delete restrict on update restrict;

alter table user add constraint fk_user_roles foreign key (rol_name)
      references roles (rol_name) on delete restrict on update restrict;

alter table user_event add constraint fk_user_event foreign key (user_name)
      references user (user_name) on delete restrict on update restrict;

alter table user_event add constraint fk_user_event2 foreign key (id_event)
      references event (id_event) on delete restrict on update restrict;

alter table user_sports add constraint fk_user_sports foreign key (user_name)
      references user (user_name) on delete restrict on update restrict;

alter table user_sports add constraint fk_user_sports2 foreign key (name_sport)
      references sports (name_sport) on delete restrict on update restrict;

