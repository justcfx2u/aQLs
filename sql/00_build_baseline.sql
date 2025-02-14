CREATE SCHEMA IF NOT EXISTS xonstat
    AUTHORIZATION xonstat;

-- table definitions
\i /docker-entrypoint-initdb.d/players.tab
--\i /docker-entrypoint-initdb.d/cd_mutator.tab
\i /docker-entrypoint-initdb.d/cd_game_type.tab
\i /docker-entrypoint-initdb.d/cd_weapon.tab
\i /docker-entrypoint-initdb.d/servers.tab
\i /docker-entrypoint-initdb.d/maps.tab
--\i /docker-entrypoint-initdb.d/map_game_types.tab
\i /docker-entrypoint-initdb.d/games.tab
\i /docker-entrypoint-initdb.d/player_game_stats.tab
--\i /docker-entrypoint-initdb.d/game_mutators.tab
\i /docker-entrypoint-initdb.d/cd_achievement.tab
\i /docker-entrypoint-initdb.d/achievements.tab
\i /docker-entrypoint-initdb.d/player_weapon_stats.tab
\i /docker-entrypoint-initdb.d/hashkeys.tab
\i /docker-entrypoint-initdb.d/db_version.tab
\i /docker-entrypoint-initdb.d/player_nicks.tab
\i /docker-entrypoint-initdb.d/player_elos.tab
\i /docker-entrypoint-initdb.d/player_ranks.tab
\i /docker-entrypoint-initdb.d/player_ranks_history.tab
\i /docker-entrypoint-initdb.d/cd_ladder.tab
\i /docker-entrypoint-initdb.d/player_ladder_ranks.tab
\i /docker-entrypoint-initdb.d/player_map_captimes.tab
\i /docker-entrypoint-initdb.d/summary_stats.tab
\i /docker-entrypoint-initdb.d/team_game_stats.tab
\i /docker-entrypoint-initdb.d/player_game_anticheats.tab
\i /docker-entrypoint-initdb.d/player_groups.tab

begin;

-- game types
insert into cd_game_type(game_type_cd, descr)
values('as', 'Assault');
insert into cd_game_type(game_type_cd, descr)
values('ctf', 'Capture The Flag');
insert into cd_game_type(game_type_cd, descr)
values('ca', 'Clan Arena');
insert into cd_game_type(game_type_cd, descr)
values('dm', 'Deathmatch');
insert into cd_game_type(game_type_cd, descr)
values('dom', 'Domination');
insert into cd_game_type(game_type_cd, descr)
values('ft', 'Freezetag');
insert into cd_game_type(game_type_cd, descr)
values('lms', 'Last Man Standing');
insert into cd_game_type(game_type_cd, descr)
values('ons', 'Onslaught');
insert into cd_game_type(game_type_cd, descr)
values('tdm', 'Team Deathmatch');
insert into cd_game_type(game_type_cd, descr)
values('duel', 'Duel');

-- weapons
insert into cd_weapon(weapon_cd, descr) values('laser', 'Laser');
insert into cd_weapon(weapon_cd, descr) values('shotgun', 'Shotgun');
insert into cd_weapon(weapon_cd, descr) values('uzi', 'Machine Gun');
insert into cd_weapon(weapon_cd, descr) values('grenadelauncher', 'Mortar');
insert into cd_weapon(weapon_cd, descr) values('electro', 'Electro');
insert into cd_weapon(weapon_cd, descr) values('crylink', 'Crylink');
insert into cd_weapon(weapon_cd, descr) values('nex', 'Nex');
insert into cd_weapon(weapon_cd, descr) values('hagar', 'Hagar');
insert into cd_weapon(weapon_cd, descr) values('rocketlauncher', 'Rocket Launcher');
insert into cd_weapon(weapon_cd, descr) values('minstanex', 'MinstaNex');
insert into cd_weapon(weapon_cd, descr) values('rifle', 'Camping Rifle');
insert into cd_weapon(weapon_cd, descr) values('fireball', 'Fireball');
insert into cd_weapon(weapon_cd, descr) values('minelayer', 'Minelayer');
insert into cd_weapon(weapon_cd, descr) values('seeker', 'T.A.G. Seeker');
insert into cd_weapon(weapon_cd, descr) values('tuba', '@!#%''n Tuba');
insert into cd_weapon(weapon_cd, descr) values('hlac', 'Heavy Laser Assault Cannon');
insert into cd_weapon(weapon_cd, descr) values('hook', 'Grappling Hook');
insert into cd_weapon(weapon_cd, descr) values('porto', 'Port-O-Launch');
insert into cd_weapon(weapon_cd, descr) values('blaster', 'Blaster');
insert into cd_weapon(weapon_cd, descr) values('devastator', 'Devastator');
insert into cd_weapon(weapon_cd, descr) values('machinegun', 'Machine Gun');
insert into cd_weapon(weapon_cd, descr) values('mortar', 'Mortar');
insert into cd_weapon(weapon_cd, descr) values('vaporizer', 'Vaporizer');
insert into cd_weapon(weapon_cd, descr) values('vortex', 'Vortex');

-- achievements
insert into cd_achievement(achievement_cd, descr, active_ind)
values(1, 'Play a game online.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(2, 'Play each of the game types.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(3, 'Register online.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(4, 'Get higher than 50% nex accuracy in a single game.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(5, 'Play in 50 games.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(6, 'Play in 100 games.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(7, 'Play in 250 games.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(8, 'Play in 500 games.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(9, 'Play in 1000 games.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(10,'Get more than 10 carrier kills in a single game.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(11,'Get more than 5 captures in a single game.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(12,'Accumulate 10 hours of play.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(13,'Accumulate 24 hours of play.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(14,'Accumulate 48 hours of play.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(15,'Accumulate 1 week of play.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(16,'Get more than 5 laser kills in a single game.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(17,'Get more than 10 laser kills in a single game.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(18,'Get greater than 25% accuracy with the machine gun in a single game.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(19,'Get more frags than deaths in a single game.', 'Y');
insert into cd_achievement(achievement_cd, descr, active_ind)
values(20,'Be the highest scorer in a game.', 'Y');

-- bots and untracked players have special records in player
insert into players (nick) values ('Bot');
insert into players (nick) values ('Untracked Player');

-- version tracking
insert into db_version(version, descr) values('1.0.0', 'Initial build');

commit;
