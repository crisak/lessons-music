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


    const { body } = req;

    // Validate request
    if (!body.idLesson || !body.note) {
        return res.status(400).send({ message: "Bad request" });
    }

    const { idLesson, note } = body;

    const query = {
        // give the query a unique name
        name: 'fetch-user',
        text: `INSERT INTO public.notes(id_lesson_user, note)
                VALUES ($1, $2)`,
        values: [idLesson, note]
    }

    const responseQuery = await db.query(query);

    console.log(responseQuery);

    res.status(200).send({
        status: true
    });
};
