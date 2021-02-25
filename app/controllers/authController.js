'use strict';

const bcrypt = require('bcrypt');
const config = require("../config/authConfig");
const jwt = require("jsonwebtoken");
const db = require("../db")();



const genereteToken = (idUser,) => {
    const token = jwt.sign({ id: idUser }, config.secret, {
        expiresIn: 86400 // 24 hours
    });

    return token;
};

exports.signin = async (req, res) => {

    const body = req.body;

    // Validate request
    if (!body.email || !body.password) {
        return res.status(400).send({ message: "Bad request" });
    }


    const { email, password } = body;
    const query = {
        // give the query a unique name
        name: 'fetch-user',
        text: 'SELECT * FROM users WHERE email = $1',
        values: [email],
    }

    const responseQuery = await db.query(query);

    if (!responseQuery || responseQuery.length === 0 || responseQuery.rows.length === 0) {
        return res.status(404).send({
            message: "User Not found."
        });
    }

    const [user] = responseQuery.rows;

    const passwordIsValid = bcrypt.compareSync(
        password,
        user.password
    );

    console.log("Calve");

    if (!passwordIsValid) {
        return res.status(401).send({
            accessToken: null,
            message: "Invalid Password!"
        });
    }

    res.status(200).send({
        idUser: user.id_user,
        email: user.email,
        accessToken: genereteToken(user.idUser)
    });
};
