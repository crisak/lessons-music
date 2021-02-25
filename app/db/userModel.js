module.exports = (sequelize, Sequelize) => {
    const User = sequelize.define("users", {
        idUser: {
            type: Sequelize.INTEGER,
            primaryKey: true
        },
        email: {
            type: Sequelize.STRING
        },
        password: {
            type: Sequelize.STRING
        }
    });

    return User;
};
