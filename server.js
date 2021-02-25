'use strict';

const express = require("express");
const cors = require("cors");

const app = express();

var corsOptions = {
    origin: "http://localhost:8081"
};

app.use(cors(corsOptions));

app.use(express.json({ extended: true }));


// routes
require('./app/routers/authRouter')(app);
require('./app/routers/lessonsRouter')(app);
require('./app/routers/notesRouter')(app);

// simple route
app.get("/", (req, res) => {
    res.json({ message: "Welcome to lessons music" });
});



// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
});
