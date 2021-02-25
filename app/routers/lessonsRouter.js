'use strict';

const controller = require("../controllers/lessonsController");
const { authJwt } = require("../millware");

module.exports = function (app) {
    app.use(function (req, res, next) {
        res.header(
            "Access-Control-Allow-Headers",
            "x-access-token, Origin, Content-Type, Accept"
        );
        next();
    });

    app.get(
        "/api/lessons",
        [authJwt.verifyToken],
        controller.getLessonsByUser
    );
};
