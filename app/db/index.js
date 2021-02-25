// const Sequelize = require("sequelize");
const {
    DB,
    USER: USER_DATA_BASE,
    PASSWORD,
    HOST,
    PORT,
} = require("../config/dbConfig");

const { Client } = require('pg');

const connectDatabase = () => {
    try {
        const client = new Client({
            user: USER_DATA_BASE,
            password: PASSWORD,
            host: HOST,
            port: PORT,
            database: DB
        });
        client.end

        client.connect();
        return client;
    } catch (error) {
        console.error("Error database: ", error);
        process.exit(1); // Stop app
    }
};



module.exports = connectDatabase;
