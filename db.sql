-- таблица жанров
CREATE TABLE genre(
    genre_id serial primary key,
    title varchar(64)
);

-- таблица карьеры  (ну или профессии или направления)
CREATE TABLE career(
    career_id serial primary key,
    title varchar(64)
);

-- таблица людишек
CREATE TABLE person(
    person_id serial primary key,
    full_name varchar(255),
    career int REFERENCES career(career_id) NOT NULL,
    date_of_birth date,
    place_of_birth varchar(255),
    genres int REFERENCES genre(genre_id) NOT NULL,
    total_movies varchar(255)
);

-- таблица фильмов
CREATE TABLE movie(
    movie_id serial primary key,
    title varchar(255),
    date_movie date,
    country varchar(255),
    genres int REFERENCES genre(genre_id) NOT NULL,
    slogan varchar(255) NOT NULL,
    director_id int REFERENCES person(person_id) NOT NULL,
    screenwriter_id int REFERENCES person(person_id) NOT NULL,
    producer_id int REFERENCES person(person_id) NOT NULL,
    operator_id int REFERENCES person(person_id) NOT NULL,
    composer_id int REFERENCES person(person_id) NOT NULL,
    artist_id int REFERENCES person(person_id) NOT NULL,
    mounting_id int REFERENCES person(person_id) NOT NULL,
    budget int,
    marketing int,
    cash_country int,
    cash_world int,
    premiere_ru varchar(255),
    premiere_world varchar(255),
    age_restriction varchar(255),
    mpaa_rating varchar(64),
    duration int
);


-- многие ко многим
--таблица для актеров главных ролей и актеров дубляжа
CREATE TABLE movie_person(
    movie_id int REFERENCES movie(movie_id),
    person_id int REFERENCES person(person_id),
    CONSTRAINT movie_person_pk PRIMARY KEY (movie_id, person_id)
);

--  таблица зрителей по странам
CREATE TABLE audience_country(
    audience_id serial primary key,
    title_country varchar(255),
    quantity int
);

--таблица для просмотра кол-ва зрителей разных фильмов

CREATE TABLE movie_audience(
    movie_id int REFERENCES movie(movie_id),
    audience_id int REFERENCES audience_country(audience_id),
    CONSTRAINT movie_audience_pk PRIMARY KEY (movie_id, audience_id)
);