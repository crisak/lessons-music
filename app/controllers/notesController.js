'use strict';

const db = require("../db")();

exports.getNotesByLession = async (req, res) => {

    const idLesson = Number((req.params || {}).idLesson);

    // Validate request
    if (!req.idUser || !idLesson) {
        return res.status(400).send({ message: "Bad request" });
    }


    const idUser = req.idUser;
    const query = {
        // give the query a unique name
        name: 'fetch-user',
        text: `SELECT n.id_note, n.note FROM users u
                INNER JOIN lessons_users l
                ON u.id_user = l.id_user
                INNER JOIN notes n
                ON n.id_lesson_user = l.id_lesson_user
                WHERE u.id_user = $1 AND l.id_lesson = $2`,
        values: [idUser, idLesson]
    }

    const responseQuery = await db.query(query);

    if (!responseQuery || responseQuery.rows.length === 0) {
        res.status(200).send({
            data: []
        });
    }

    res.status(200).send({
        data: responseQuery.rows
    });
};

exports.createNote = async (req, res) => {

    // Validate request
    if (!req.idUser) {
        return res.status(400).send({ message: "Bad request" });
    }


    const idUser = req.idUser;
    const query = {
        // give the query a unique name
        name: 'fetch-user',
        text: `SELECT l.id_lesson, l.title, l.description FROM users u
                INNER JOIN lessons_users
                ON u.id_user = lessons_users.id_user
                INNER JOIN lessons l
                ON l.id_lesson = lessons_users.id_lesson
                WHERE u.id_user = $1`,
        values: [idUser]
    }

    const responseQuery = await db.query(query);

    if (!responseQuery || responseQuery.rows.length === 0) {
        res.status(200).send({
            data: []
        });
    }

    res.status(200).send({
        data: responseQuery.rows
    });
};
